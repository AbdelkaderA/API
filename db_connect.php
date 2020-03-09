<?php


function db_connect(){
    $host = "localhost";
    $user = "root" ;
    $pass = "";
    $db = "testcommande";
    $port = 3308 ;
    return new PDO('mysql:host='.$host.';dbname='.$db.';port='.$port,$user,$pass);
}