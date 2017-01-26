<?php

class MyAcl {

    public static function check($usuario, $controlador, $accion) {
        Logger::debug('Probando ACL');
        Logger::debug('Usuario: ' .$usuario );
        Logger::debug('Controller: ' .$controlador);
        Logger::debug('Action: ' .$accion );
        
        
        $recursos = (new PerfilRecurso)->getRecursosUsuario($usuario);
        $tienePermiso = false;
        foreach ($recursos as $item):
            if (($item->controlador == $controlador || $item->controlador == '*')&& ($item->accion == $accion || $item->accion == '*')) {
                $tienePermiso = true;
            }
        endforeach;        
        Logger::debug('Permiso: ' . ($tienePermiso == true ? 'Si' : 'No'));
        
        return $tienePermiso;
    }

}
