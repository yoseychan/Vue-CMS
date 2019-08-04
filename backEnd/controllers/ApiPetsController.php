<?php
namespace Cms\Controllers;

use Cms\Core\App;

class ApiPetsController {
    public function index()
    {
        $pets =  App::get('db')->fetchAll("pets");

        echo json_encode($pets);
    }

    public function find()
    {
        $pet =  App::get('db')->fetchOne("pets", $_POST);

        echo json_encode($pet[0]);
    }

    public function store()
    {
        reset($_POST);
        $values = key($_POST);
        App::get('db')->insert("pets", (array)json_decode($values));

        echo json_encode([
            'result' => 'success'
        ]);
    }

    public function update()
    {

        reset($_POST);
        $values = key($_POST);

        App::get('db')->update("pets", (array)json_decode($values));
        echo json_encode([
            'result' => 'success'
        ]);
    }

    public function delete()
    {
        reset($_POST);
        $values = key($_POST);
        App::get('db')->delete("pets", (array)json_decode($values));
        echo json_encode([
            'result' => 'success'
        ]);
    }
}