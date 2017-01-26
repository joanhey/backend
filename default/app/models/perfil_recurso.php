<?php

class PerfilRecurso extends ActiveRecord
{
    public $logger = true;
    
    function getPerfilesRecursos($page = 1) {
        $sql = "SELECT perfil_recurso.id,perfil.nombre as perfil_id,concat(recurso.controlador,'.',recurso.accion) as recurso_id, perfil_recurso.creado_at, perfil_recurso.actualizado_in ";
        $sql .= "FROM perfil_recurso INNER JOIN perfil ON perfil_recurso.perfil_id = perfil.id " .
                "INNER JOIN recurso ON perfil_recurso.recurso_id = recurso.id " .
                "ORDER BY perfil.nombre, recurso.controlador, recurso.accion";
        return $this->paginate_by_sql($sql, $page);
    }
    
    function getRecursosUsuario($id)
    {
        $sql = "select recurso.controlador, recurso.accion
                from perfil_recurso inner join recurso 
                on recurso.id = perfil_recurso.recurso_id
                where perfil_recurso.perfil_id in (
                select perfil_id from perfil_usuario where usuario_id = {$id})";
        return $this->find_all_by_sql($sql);
    }
}