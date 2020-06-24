<?php

namespace App\Controller;

use eZ\Publish\API\Repository\Values\Content\Relation;
use eZ\Publish\Core\MVC\Symfony\View\ContentView;
use eZ\Publish\Core\Repository\SiteAccessAware\Repository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PointOfInterestController extends AbstractController
{
    /** @var Repository */
    private $repository;

    public function __construct(Repository $repository)
    {
        $this->repository = $repository;
    }

    public function pointOfInterestView(ContentView $view): ContentView
    {
        $reverseRelations = $this->repository->sudo(function (Repository $repository) use ($view) {
            return $repository->getContentService()->loadReverseRelations($view->getContent()->contentInfo);
        });

        $rideContentInfoList = [];

        /** @var Relation $relation */
        foreach ($reverseRelations as $relation) {
            $sourceContentInfo = $relation->getSourceContentInfo();

            if ($sourceContentInfo->isHidden || !$sourceContentInfo->isPublished()) {
                continue;
            }

            if ('bike_ride' !== $sourceContentInfo->getContentType()->identifier) {
                continue;
            }

            // Because previously loaded with sudo, make sure that the user can read it.
            if ($this->repository->getPermissionResolver()->canUser('content', 'read', $sourceContentInfo)) {
                $rideContentInfoList[] = $sourceContentInfo;
            }
        }

        $rides = $this->repository->getContentService()->loadContentListByContentInfo($rideContentInfoList);

        $view->addParameters([
            'rides' => $rides,
        ]);

        return $view;
    }
}
