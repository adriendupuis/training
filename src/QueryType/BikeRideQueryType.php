<?php

namespace App\QueryType;

use eZ\Publish\API\Repository\Values\Content\Query;
use eZ\Publish\Core\QueryType\QueryType;

/**
 * Class BikeRideQueryType
 */
class BikeRideQueryType implements QueryType
{
    public function getQuery(array $parameters = []): Query
    {
        $criteria = [
            new Query\Criterion\ContentTypeIdentifier($parameters['contentType']),
            new Query\Criterion\Visibility(Query\Criterion\Visibility::VISIBLE),
        ];

        if (!empty($parameters['parentLocationId'])) {
            $criteria[] = new Query\Criterion\ParentLocationId($parameters['parentLocationId']);
        }

        if (!empty($parameters['searchText'])) {
            $criteria[] = new Query\Criterion\FullText($parameters['searchText']);
        }

        return new Query([
            'filter' => new Query\Criterion\LogicalAnd($criteria),
            'performCount' => $parameters['count'] ?? false,
        ]);
    }

    public function getSupportedParameters(): array
    {
        return ['contentType', 'parentLocationId', 'count', 'searchText'];
    }

    public static function getName(): string
    {
        return 'BikeRideList';
    }
}
