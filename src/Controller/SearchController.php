<?php

namespace App\Controller;

use eZ\Publish\API\Repository\SearchService;
use eZ\Publish\Core\Pagination\Pagerfanta\ContentSearchAdapter;
use eZ\Publish\Core\QueryType\QueryTypeRegistry;
use Pagerfanta\Pagerfanta;
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

    public function bikeRidePaginatedSearch(Request $request): Response
    {
        $searchText = $request->get('q');

        $query = $this->queryTypeRegistry->getQueryType('BikeRideList')->getQuery([
            'contentType' => 'bike_ride',
            'searchText' => $searchText,
            'count' => true,
        ]);

        $pager = new Pagerfanta(
            new ContentSearchAdapter($query, $this->searchService)
        );
        $currentPage = $request->get('page');

        $pager->setMaxPerPage(3);
        $pager->setCurrentPage(min(max($currentPage, 1), $pager->getNbPages()));

        return ($this->render(
            '@ezdesign/search_pagination.html.twig',
            [
                'bike_rides' => $pager,
                'search_text' => $searchText
            ]
        ));
    }

}