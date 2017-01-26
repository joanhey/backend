<?php

//my_auth.php en app/libs
class MyAuth {

    public static function check($login, $password) {
        $usuario = (new Usuario)->getByLogin($login);  //para ActiveRecord de fabrica
        if ($usuario && password_verify($password, $usuario->password)) {
            Session::set('login', $usuario->login);
            Session::set('id', $usuario->id);
            Session::set('email', $usuario->email);
            return true;
        } else {
            Logger::debug('no concuerda clave');
            return false;
        }
    }

    public static function isAuth() {
        return self::get('login') != null;
    }

    public static function get($key) {
        return Session::get($key) != null ? Session::get($key) : null;
    }

    public static function destroy() {
        Session::delete('login');
        Session::delete('id');
        Session::delete('empresa_id');
        Session::delete('email');
        return true;
    }

}
