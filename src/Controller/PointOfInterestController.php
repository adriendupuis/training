<?php

namespace App\Controller;

use eZ\Publish\API\Repository\SearchService;
use eZ\Publish\API\Repository\Values\Content\Content;
use eZ\Publish\API\Repository\Values\Content\Query;
use eZ\Publish\API\Repository\Values\Content\Search\SearchHit;
use eZ\Publish\Core\MVC\Symfony\View\ContentView;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PointOfInterestController extends AbstractController
{
    /** @var SearchService */
    private $searchService;

    public function __construct(SearchService $searchService)
    {
        $this->searchService = $searchService;
    }

    public function pointOfInterestView(ContentView $view): ContentView
    {
        $currentContent = $view->getContent();

        $query = new Query([
            'filter' => new Query\Criterion\LogicalAnd([
                new Query\Criterion\ContentTypeIdentifier('bike_ride'),
                new Query\Criterion\Visibility(Query\Criterion\Visibility::VISIBLE),
                new Query\Criterion\FieldRelation('pois', Query\Criterion\Operator::CONTAINS, [$currentContent->id]),
            ]),
            'performCount' => false,
        ]);
        $rideSearchHits = $this->searchService->findContent($query)->searchHits;

        $rides = [];
        foreach ($rideSearchHits as $searchHit) {
            /** @var Content $ride */
            $ride = $searchHit->valueObject;

            if (!$ride->contentInfo->isPublished()) {
                continue;
            }

            $rides[] = $ride;
        }

        $view->addParameters([
            'rides' => $rides,
        ]);

        return $view;
    }
}
