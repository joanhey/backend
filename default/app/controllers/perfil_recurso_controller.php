<?php

class PerfilRecursoController extends ScaffoldController {

    public $model = "perfil_recurso";
    public $scaffold = "bs";

    function index($page = 1)
    {
        $this->data = (new PerfilRecurso)->getPerfilesRecursos($page);
    }
    
}
