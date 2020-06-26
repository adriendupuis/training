<?php

namespace App\EventSubscriber;

use eZ\Publish\API\Repository\Values\Content\Query;
use EzSystems\EzPlatformPageFieldType\FieldType\Page\Block\Renderer\BlockRenderEvents;
use EzSystems\EzPlatformPageFieldType\FieldType\Page\Block\Renderer\Event\PreRenderEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use eZ\Publish\API\Repository\SearchService;

class RandomEventSubscriber implements EventSubscriberInterface
{
    /** @var SearchService */
    private $searchService;

    /**
     * @param SearchService $searchService
     */
    public function __construct(
        SearchService $searchService
    ) {
        $this->searchService = $searchService;
    }

    public static function getSubscribedEvents()
    {
        return [
            BlockRenderEvents::getBlockPreRenderEventName('random') => 'onBlockPreRender',
        ];
    }

    public function onBlockPreRender(PreRenderEvent $event)
    {
        $renderRequest = $event->getRenderRequest();
        $parameters = $renderRequest->getParameters();

        $blockValue = $event->getBlockValue();

        $query = new Query([
            'filter' => new Query\Criterion\LogicalAnd([
                new Query\Criterion\ContentTypeIdentifier($blockValue->getAttribute('content_type')->getValue()),
                new Query\Criterion\Visibility(Query\Criterion\Visibility::VISIBLE),
            ]),
            'sortClauses' => [new Query\SortClause\Random(),],
            'limit' => 1,
        ]);

        $searchHits = $this->searchService->findContent($query)->searchHits;

        $parameters['random'] = count($searchHits) ? $searchHits[0]->valueObject : null;
        $renderRequest->setParameters($parameters);
    }
}
