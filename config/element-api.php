<?php

use craft\elements\Entry;
use craft\helpers\UrlHelper;

return [
    'endpoints' => [
        'cards.json' => function() {
            return [
                'elementType' => Entry::class,
                'criteria' => ['section' => 'card'],
                'transformer' => function(Entry $entry) {
                    return [
                        'id' => $entry->id,
                        'title' => $entry->title,
                        'abstract' => $entry->cardAbstract,
                        'jsonUrl' => UrlHelper::url("cards/{$entry->id}.json"),
                    ];
                },
            ];
        },
        'cards/<entryId:\d+>.json' => function($entryId) {
            return [
                'elementType' => Entry::class,
                'criteria' => ['id' => $entryId],
                'one' => true,
                'transformer' => function(Entry $entry) {
                    // Create an array of all the thumbnail URLs if had option for more than one
                    // $thumbnails = [];
                    // foreach ($entry->cardThumbnail->all() as $thumbnail) {
                    //     $thumbnails[] = $thumbnail->url;
                    // }

                    return [
                        'title' => $entry->title,
                        'abstract' => $entry->cardAbstract,
                        'thumbnail' => $entry->cardThumbnail->one()->url
                    ];
                },
            ];
        },
    ]
];