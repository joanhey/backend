<?php

class Configuracion extends ActiveRecord {

    public function isOffline() {
        $salida = false;
        $item = $this->find_first("conditions: tag = 'OFFLINE'");
        if ($item != null) {
            if ($item->valor == "ON") {
                $salida = true;
            }
        }
        return $salida;
    }

}
