<?php

/**
 * Controller por defecto si no se usa el routes
 *
 */
class IndexController extends AppController {

    public function index() {
        $this->title = "Bienvenido";
        $this->items = (new Categoria)->getItemsBySlug('blog');
    }

}
