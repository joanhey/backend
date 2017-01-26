<?php

class Textos {

    private $elementos;

    function __construct() {
        $this->elementos['titulo'] = "Empresa 1";
        $this->elementos['slogan'] = "Texto de slogan";
        $this->elementos['icono'] = "fa fa-leaf";
    }

    function get($element) {
        return $this->elementos[$element];
    }

}
