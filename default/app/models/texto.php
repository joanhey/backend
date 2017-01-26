<?php

class Texto extends ActiveRecord {

    function getBySlug($slug) {
        $item = $this->find_first("slug = '" . $slug . "'");
        return isset($item->texto) ? $item->texto : "";
    }

}
