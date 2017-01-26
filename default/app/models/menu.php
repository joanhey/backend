<?php

class Menu extends ActiveRecord {

    public $displayField = "nombre";
    public $logger = true;

    function initialize() {
        $this->belongs_to('menu');
    }

    function getMenus($page = 1) {

        $sql = "SELECT m.id,m.nombre,m.icono,
				m.url, (select nombre from menu where id = m.menu_id) as menu_id, 
				concat(recurso.controlador, '.', recurso.accion) as recurso_id, 
				m.creado_at, m.actualizado_in 
				FROM menu m LEFT OUTER JOIN recurso 
				ON m.recurso_id = recurso.id 
				ORDER BY m.id";
        //Logger::debug($sql);
        return $this->paginate_by_sql($sql, "page: $page");
    }        

    function getChild($id) {
        return $this->find('conditions: menu_id = ' . (int) $id);
    }

}
