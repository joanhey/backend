<?php

class PerfilUsuarioController extends ScaffoldController {

    public $model = "perfil_usuario";
    public $scaffold = "bs";
    
    function index($page = 1)
    {
        $this->data = (new PerfilUsuario)->getPerfilesUsuarios($page);
    }

}