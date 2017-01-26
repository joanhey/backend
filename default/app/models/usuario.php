<?php

//usuario.php en app/models -- para ActiveRecord de fábrica
class Usuario extends ActiveRecord {

    function before_create() {
        $opciones = [
            'cost' => 12,
        ];
        $hash = password_hash($this->password, PASSWORD_BCRYPT, $opciones);
        $this->password = $hash;
    }

    public function getByLogin($login) {
        $item = $this->find_first("conditions: login = '" . $login . "'");
        //Logger::debug((array) $item);
        return $item;
    }

}
