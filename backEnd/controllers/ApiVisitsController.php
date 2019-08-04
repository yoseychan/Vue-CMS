<?php

namespace Cms\Controllers;

use Cms\Core\App;

class ApiVisitsController
{
    public function index()
    {
        $visits = App::get('db')->fetchAll("visits");

        echo json_encode($visits);
    }

    public function find()
    {
        $visit = App::get('db')->fetchOne("visits", $_POST);

        echo json_encode($visit[0]);
    }

    public function store()
    {
        reset($_POST);
        $values = key($_POST);
        App::get('db')->insert("visits", (array)json_decode($values));

        echo json_encode([
            'result' => 'success'
        ]);
    }

    public function update()
    {

        reset($_POST);
        $values = key($_POST);

        App::get('db')->update("visits", (array)json_decode($values));
        echo json_encode([
            'result' => 'success'
        ]);
    }

    public function delete()
    {
        reset($_POST);
        $values = key($_POST);
        App::get('db')->delete("visits", (array)json_decode($values));
        echo json_encode([
            'result' => 'success'
        ]);
    }
}
