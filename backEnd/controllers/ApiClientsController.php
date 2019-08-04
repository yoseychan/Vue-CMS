<?php

namespace Cms\Controllers;

use Cms\Core\App;

class ApiClientsController
{
    public function index()
    {
        $clients = App::get('db')->fetchAll("clients");

        echo json_encode($clients);
    }

    public function find()
    {
        $client = App::get('db')->fetchOne("clients", $_POST);

        echo json_encode($client[0]);
    }

    public function store()
    {
        reset($_POST);
        $values = key($_POST);
        App::get('db')->insert("clients", (array)json_decode($values));

        echo json_encode([
            'result' => 'success'
        ]);
    }

    public function update()
    {

        reset($_POST);
        $values = key($_POST);

        App::get('db')->update("clients", (array)json_decode($values));
        echo json_encode([
            'result' => 'success'
        ]);
    }

    public function delete()
    {
        reset($_POST);
        $values = key($_POST);
        App::get('db')->delete("clients", (array)json_decode($values));
        echo json_encode([
            'result' => 'success'
        ]);
    }
}