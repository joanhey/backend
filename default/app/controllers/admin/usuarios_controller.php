<?php

class UsuariosController extends ScaffoldController {

    public $model = 'usuario';
    public $scaffold = 'bs';

    public function index($page = 1) {
        $this->title = "Lista de " . ucwords("$this->model");
        $this->data = (new Usuario)->paginate("page: $page", 'order: id');
    }

}
