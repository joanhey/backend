<?php

class Item extends ActiveRecord {

    function initialize() {
        $this->belongs_to('categoria');
        $this->has_many('imagenes', 'model: imagen');
    }

    function before_create() {
        $this->activo = 1;
        $this->slug = Slug::clean($this->nombre);
    }

    function before_save() {
        $this->slug = Slug::clean($this->nombre);
    }

    function getBySlug($slug) {
        return $this->find_first("conditions: slug = '" . $slug . "'");
    }

    function getAllDestacados() {
        return $this->find("conditions: destacado = 1");
    }

    function getLast($categoria) {
        $sql = sprintf("SELECT item.* FROM item INNER JOIN categoria 
                ON item.categoria_id = categoria.id 
                WHERE categoria.slug = '%s' 
                ORDER BY item.created_at DESC
                LIMIT 1", $categoria);
        return $this->find_by_sql($sql);
    }

}