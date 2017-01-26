<?php

Load::models('categoria', 'menu');

class CategoriasController extends AdminController {

    public function index() {
        $this->categorias = (new Categoria)->find();
    }

    public function agregar() {
        if (Input::hasPost('categoria')) {
            $categoria = (new Categoria);
            if ($categoria->create(Input::post('categoria'))) {
                Flash::valid('Elemento creado exitosamente');
                return Redirect::to(); // al index de forma predeterminada
            }
        }
    }

    public function editar($id) {
        if (Input::hasPost('categoria')) {
            $categoria = (new Categoria)->find_by_id((int) $id);
            if ($categoria->update(Input::post('categoria'))) {
                Flash::valid('Elemento actualizado exitosamente');
                return Redirect::to(); // al index de forma predeterminada
            } else {
                Flash::error('fue imposible actualizar el elemento');
            }
        }
        $this->categoria = (new Categoria)->find_by_id((int) $id);
    }

    public function borrar($id) {
        $categoria = (new Categoria)->find_by_id((int) $id);
        if ($categoria->delete()) {
            Flash::valid('Elemento eliminado exitosamente');
        } else {
            Flash::error('fue imposible eliminar el elemento');
        }
        return Redirect::to();
    }

}
