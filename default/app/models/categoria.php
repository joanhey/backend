<?php
class Categoria extends ActiveRecord {

    function before_create() {
        $this->activa = 1;
    }

    public function initialize() {
        $this->has_many('item');
    }

    function before_save() {
        $this->slug = Slug::clean($this->nombre);
    }

    function getItemsBySlug($slug) {
        $categoria = $this->getBySlug($slug);

        return (new Item)->find("conditions: categoria_id = " . $categoria->id, "order: nombre");
    }

    function getBySlug($slug) {
        return $this->find_first("conditions: slug = '" . $slug . "'");
    }

    function getAll() {
        return $this->find("conditions: visible = 1", "order: orden");
    }

}

?>
