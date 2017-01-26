<?php

trait SlugableTrait {

    function getBySlug($slug, $field) {
        $item = $this->find_first("conditions: slug='" . $slug . "'");
        return $item->$field ? $item->$field : '';
    }

}
