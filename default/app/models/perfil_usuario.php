<?php

class PerfilUsuario extends ActiveRecord
{
    function getPerfilesUsuarios($page = 1) {
        $columnas = "perfil_usuario.id,perfil.nombre as perfil_id,usuario.nombre as usuario_id, perfil_usuario.creado_at, perfil_usuario.actualizado_in";
        $joins = "INNER JOIN perfil ON perfil_usuario.perfil_id = perfil.id " .
                "INNER JOIN usuario ON perfil_usuario.usuario_id = usuario.id ";
        return $this->paginate("columns: $columnas", "join: $joins", "page: $page", "order: usuario.nombre, perfil.nombre");
    }
}