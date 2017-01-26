<?php
class MyUtil
{
	public static function d2t($dato) {
		//2013-12-31 00:00:00
		$dato = str_replace("00:00:00", "", $dato);
		$dato = trim($dato);
		$fecha = explode("-", $dato);
		
		return $fecha[2] . "-" . $fecha[1] . "-" . $fecha[0];
	}
}
