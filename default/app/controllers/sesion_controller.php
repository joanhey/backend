<?php

class SesionController extends AppController {

    function login() {
        View::select(null, 'login');
        if (Input::hasPost('login', 'password')) {
            if (MyAuth::check(Input::post('login'), Input::post('password'))) {
                Flash::valid('Bienvenido/a ' . MyAuth::get('login'));
                return Redirect::to('/dashboard/');
            }
            Flash::error('Imposible conectar');
        } else {
            Flash::error('Debe indicar su usuario y password.');
        }
        return false;
    }

    function logout() {
        MyAuth::destroy();
        Flash::error('Hasta pronto!');
        Redirect::to('/');
    }

}
