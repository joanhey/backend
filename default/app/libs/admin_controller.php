<?php

/**
 * @see Controller nuevo controller
 */
require_once CORE_PATH . 'kumbia/controller.php';

/**
 * Controlador para proteger los controladores que heredan
 * Para empezar a crear una convención de seguridad y módulos
 *
 * Todas las controladores heredan de esta clase en un nivel superior
 * por lo tanto los metodos aqui definidos estan disponibles para
 * cualquier controlador.
 *
 * @category Kumbia
 * @package Controller
 */
class AdminController extends Controller {

    final protected function initialize() {
        //Código de auth y permisos
        //Será libre, pero añadiremos uno por defecto en breve
        //Posiblemente se cree una clase abstracta con lo que debe tener por defecto
        if (!MyAuth::isAuth()) {
            View::select(null, 'login');
            return false;
        }
        if (!MyAcl::check(MyAuth::get('id'), $this->controller_name, $this->action_name))
        {
            View::select(null, 'forbiden');
            return false;
        }

        /* $acl = new MyAcl('privilegios');  //si no se especifica el archivo a usar, por defecto busca en privilegios.ini
          $modulo = $this->module_name; //obtenermos el modulo actual
          $controlador = $this->controller_name; //obtenemos el controlador actual
          $accion = $this->action_name; //y obtenemos la accion actual

          // en el ejemplo se obtiene el privilegio del usuario actual a traves de la libreria Auth
          // pero se puede aplicar algun otro método para obtener el privilegio del usuario actual
          $privilegio = Auth::get('privilegio');
          if (!$acl->check($privilegio, $modulo, $controlador, $accion)) { //verificamos si tiene ó no privilegios

          // si no posee los privilegios necesarios le enviamos un mensaje indicandoselo
          Flash::error("No posees suficientes PRIVILEGIOS para acceder a: {$modulo}/{$controlador}/{$accion}");

          //no dejamos que entre al contenido de la url si no tiene permisos
          View::select(NULL,'no_permiso');
          return false;
          } */
    }

    final protected function finalize() {

    }

}
