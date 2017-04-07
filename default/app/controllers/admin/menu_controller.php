<?php

class MenuController extends ScaffoldController {

    public $model = "menu";
    public $scaffold = "bs";

    public function index($page = 1) {
        $this->title = "Lista de " . ucwords("$this->model");
        $this->data = (new Menu)->getMenus($page);
    }

}
