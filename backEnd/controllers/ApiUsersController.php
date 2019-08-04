<?php

namespace Cms\Controllers;

use Cms\Core\App;

class ApiUsersController
{
    public function index()
    {
        $users = App::get('db')->fetchAll("users");

        echo json_encode($users);
    }

    public function find()
    {
        $user = App::get('db')->fetchOne("users", $_POST);

        echo json_encode($user[0]);
    }

    public function store()
    {
        reset($_POST);
        $values = key($_POST);
        App::get('db')->insert("users", (array)json_decode($values));

        echo json_encode([
            'result' => 'success'
        ]);
    }

    public function update()
    {

        reset($_POST);
        $values = key($_POST);

        App::get('db')->update("users", (array)json_decode($values));
        echo json_encode([
            'result' => 'success'
        ]);
    }

    public function delete()
    {
        reset($_POST);
        $values = key($_POST);
        App::get('db')->delete("users", (array)json_decode($values));
        echo json_encode([
            'result' => 'success'
        ]);
    }
}
