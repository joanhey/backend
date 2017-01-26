<?php

class Parametro extends ActiveRecord {

    function getBySlug($slug) {
        return $this->find_first("conditions: slug='{$slug}'");
    }

}
