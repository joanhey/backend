<?php

Load::models('item', 'menu', 'imagen', 'categoria');

class ArticulosController extends AdminController {

    function index() {
        $categoria = null;
        if (Input::hasPost('categoria') || Session::get('categoria') != null) {
            $categoria = (int) (Input::hasPost('categoria') ? Input::post('categoria') : Session::get('categoria'));
            if ($categoria == 0) {
                $categoria = null;
            }
        }

        if ($categoria != null) {
            $this->items = (new Item)->find("conditions: categoria_id = " . $categoria);
            Session::set('categoria', $categoria);
        } else {
            $this->items = (new Item)->find();
            Session::delete('categoria');
        }
        $this->categoria = $categoria;
    }

    function agregar() {
        if (Input::hasPost('item')) {
            $item = new Item(Input::post('item'));
            if ($item->create()) {
                Flash::valid('Item agregado exitosamente');
                Input::delete('item');
            }
        }
    }

    function editar($id) {
        if (Input::hasPost('item')) {
            $item = (new Item)->find_first($id);
            if ($item->update(Input::post('item'))) {
                Flash::valid('Item actualizado exitosamente');
            } else {
                Flash::error('Item no pudo actualizarse');
            }
        }
        $this->item = (new Item)->find_first($id);
    }

    function eliminar($id) {
        if (Input::hasPost('item')) {
            $item = (new Item)->find_first($id);
            if ($item->delete()) {
                Flash::valid('Item eliminado exitosamente');
                Redirect::to(); // ir a index
            } else {
                Flash::error('Item no pudo eliminarse');
            }
        }
        $this->item = (new Item)->find_first($id);
    }

    function imagenes($id) {
        $this->item = (new Item)->find_first($id);
        $this->imagenes = (new Imagen)->find('conditions: item_id = ' . $id);
    }

    /**
     * Accion para subir archivo
     *
     */
    public function subirimagen() {
        $item = (new Item)->find_first(Input::post('id'));

        if ((new Imagen)->guardar($item->id)) {
            Flash::valid('Imagen subida exitosamente');
        }

        Redirect::toAction('imagenes/' . $item->id);
    }

    public function quitarimagen($imagId, $itemId) {

        $imagen = (new Imagen)->find_first($imagId);
        //unlink(PUBLIC_PATH . "img/upload/" . $imagen->archivo);
        if ($imagen->delete()) {
            Flash::valid('Imagen eliminada exitosamente');
        }

        Redirect::toAction('imagenes/' . $itemId);
    }

    public function usarcomoportada($imagId, $itemId) {
        $item = (new Item)->find_first($itemId);
        $imagen = (new Imagen)->find_first($imagId);
        $item->img_portada = $imagen->archivo;
        if ($item->save()) {
            Flash::valid('Imagen asignada exitosamente como portada');
        }

        Redirect::toAction('imagenes/' . $itemId);
    }

}

//class 
