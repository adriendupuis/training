<?php

namespace App\Controller;

use eZ\Publish\API\Repository\SearchService;
use eZ\Publish\API\Repository\Values\Content\Query;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class SearchController extends AbstractController
{
    /** @var SearchService */
    public $searchService;

    public function __construct(
        SearchService $searchService
    )
    {
        $this->searchService = $searchService;
    }

    public function bikeRideSearch(Request $request): Response
    {
        $searchText = $request->get('q');

        $criteria = [
            new Query\Criterion\ContentTypeIdentifier('bike_ride'),
            new Query\Criterion\Visibility(Query\Criterion\Visibility::VISIBLE)
        ];

        if (!empty($searchText)) {
            $criteria[] = new Query\Criterion\FullText($searchText);
        }

        $results = $this->searchService->findContent(new Query([
            'filter' => new Query\Criterion\LogicalAnd($criteria),
        ]));

        return ($this->render(
            '@ezdesign/search.html.twig',
            [
                'bike_rides' => $results,
                'search_text' => $searchText
            ]

        ));
    }
}