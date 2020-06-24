<?php

namespace App\Controller;

use eZ\Publish\API\Repository\ContentService;
use eZ\Publish\API\Repository\Values\Content\Relation;
use eZ\Publish\Core\MVC\Symfony\View\ContentView;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PointOfInterestController extends AbstractController
{
    /** @var ContentService */
    private $contentService;

    public function __construct(ContentService $contentService)
    {
        $this->contentService = $contentService;
    }

    public function pointOfInterestView(ContentView $view): ContentView
    {
        $reverseRelations = $this->contentService->loadReverseRelations($view->getContent()->contentInfo);

        $rideContentInfoList = [];

        foreach ($reverseRelations as $relation) {
            $sourceContentInfo = $relation->getSourceContentInfo();

            if ($sourceContentInfo->isHidden || !$sourceContentInfo->isPublished()) {
                continue;
            }

            if ('bike_ride' !== $sourceContentInfo->getContentType()->identifier) {
                continue;
            }

            $rideContentInfoList[] = $sourceContentInfo;
        }

        $rides = $this->contentService->loadContentListByContentInfo($rideContentInfoList);

        $view->addParameters([
            'rides' => $rides,
        ]);
        return $view;
    }
}