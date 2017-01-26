<?php

class Imagen extends ActiveRecord {

    function initialize() {
        $this->belongs_to('item');
    }

    /**
     * Guardar archivo
     *
     * @return boolean
     */
    function guardar($item_id) {
        $file = Upload::factory('foto', 'image');
        // $file->setMaxWidth('14900');
        // Guarda el archivo en el directorio "public/img/upload"
        if ($archivo = $file->saveRandom()) {
            $item = new Imagen ();
            $item->item_id = $item_id;
            $item->archivo = $archivo;
            if ($item->create()) {
                return true;
            }
        }
        return false;
    }

    function getByItem($item) {
        return $this->find_all_by_sql("SELECT * FROM imagen WHERE item_id = " . $item);
    }

    function firstByItem($item) {
        return $this->find_by_sql("SELECT * FROM imagen WHERE item_id = " . $item . " limit 1");
    }

    function activas() {
        return $this->find("conditions: activa = 1");
    }

}
