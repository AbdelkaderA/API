<?php

function db_connect($dbname, $user, $pass){  // La fonction pour se connecter à la base de donnée
         
                try{
                    $db = new PDO('mysql:host=localhost;dbname='.$dbname.';port=3306', $user, $pass);
                    }
                catch(Exception $e){
                    $err = $e->getMessage();
                    echo $err ;
                }
                return $db ;
    }

$db = db_connect('testcommande','root',''); // On appelle la fonction et donc on se connecte à la bdd

$quer = $db->query('SELECT * FROM produits WHERE Categorie="'.$_GET['categorie'].'"'); // On selectionne les produits selon leur categorie (dans variable GET, dans l'URL)

while($data = $quer->fetch(PDO::FETCH_ASSOC )){ // Tant qu'on récupère des lignes (des produits)
    var_dump($data);
   header('Content-Type: application/json');  // On renvoie le code en JSON 
    echo json_encode($data, JSON_PRETTY_PRINT);

} 



?>