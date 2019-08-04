<?php

//API PETS 
$router->get('backEnd/api/pets', 'ApiPetsController@index');
$router->post('backEnd/api/pets/find', 'ApiPetsController@find');
$router->post('backEnd/api/pets', 'ApiPetsController@store');
$router->post('backEnd/api/pets/update', 'ApiPetsController@update');
$router->post('backEnd/api/pets/delete', 'ApiPetsController@delete');

//API CLIENTS
$router->get('backEnd/api/clients', 'ApiClientsController@index');
$router->post('backEnd/api/clients/find', 'ApiClientsController@find');
$router->post('backEnd/api/clients', 'ApiClientsController@store');
$router->post('backEnd/api/clients/update', 'ApiClientsController@update');
$router->post('backEnd/api/clients/delete', 'ApiClientsController@delete');

//API Users (staff)
$router->get('backEnd/api/users', 'ApiUsersController@index');
$router->post('backEnd/api/users/find', 'ApiUsersController@find');
$router->post('backEnd/api/users', 'ApiUsersController@store');
$router->post('backEnd/api/users/update', 'ApiUsersController@update');
$router->post('backEnd/api/users/delete', 'ApiUsersController@delete');

//API Visits (with report)
$router->get('backEnd/api/visits', 'ApiVisitsController@index');
$router->post('backEnd/api/visits/find', 'ApiVisitsController@find');
$router->post('backEnd/api/visits', 'ApiVisitsController@store');
$router->post('backEnd/api/visits/update', 'ApiVisitsController@update');
$router->post('backEnd/api/visits/delete', 'ApiVisitsController@delete');



