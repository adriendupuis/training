<?php

namespace App\EventSubscriber;

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

        $renderRequest->setParameters(['hello' => 'world']);
    }
}
