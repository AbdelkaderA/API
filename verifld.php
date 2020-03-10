<?php
session_start();
if (isset ($_GET ['user']) && isset ($_GET ['password'])){

    $id = $_GET['user'];
    $pass = $_GET['password'];
    include 'db_connect.php';

    $db = db_connect() ;
    
    $verif = $db->prepare('SELECT idUSer FROM utilisateur WHERE idUser= ? AND MDP = ? ');
    $verif->execute(array($id, $pass));

    $result = $verif -> fetch() ;

    if(!empty($result)){
        $_SESSION['user'] = $id ;
        $welcome[] = "Bienvenue ! " ;
        header('Content-Type: application/json');  // On renvoie le code en JSON 
        echo json_encode($welcome, JSON_PRETTY_PRINT);
    }
    else{
        $wu[] = "Mauvais utilisateur";
        header('Content-Type: application/json');  // On renvoie le code en JSON 
        echo json_encode($wu, JSON_PRETTY_PRINT);

    }
}

?>