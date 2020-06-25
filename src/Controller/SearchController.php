<?php

namespace App\Controller;

use eZ\Publish\API\Repository\SearchService;
use eZ\Publish\Core\QueryType\QueryTypeRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class SearchController extends AbstractController
{
    /** @var SearchService */
    private $searchService;

    /** @var QueryTypeRegistry */
    public $queryTypeRegistry;

    public function __construct(
        SearchService $searchService,
        QueryTypeRegistry $queryTypeRegistry
    )
    {
        $this->searchService = $searchService;
        $this->queryTypeRegistry = $queryTypeRegistry;
    }

    public function bikeRideSearch(Request $request): Response
    {
        $searchText = $request->get('q');

        $query = $this->queryTypeRegistry->getQueryType('BikeRideList')->getQuery([
            'contentType' => 'bike_ride',
            'searchText' => $searchText,
        ]);
        $results = $this->searchService->findContent($query);

        return ($this->render(
            '@ezdesign/search.html.twig',
            [
                'bike_rides' => $results,
                'search_text' => $searchText
            ]

        ));
    }
}