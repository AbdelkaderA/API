<?php

include 'db_connect.php' ;

$db = db_connect();

$adresses = $_POST ["Adresses_idAdresses"];
$utilisateur = $_POST ["Utilisateur_idUser"];
$produitCmd = $_POST ["Produits_idProduits"];
$quantite = $_POST ["Quantité"];


$query = 
"INSERT INTO commande (Adresses_idAdresses, Utilisateur_idUser) 
VALUES (".$adresses.",".$utilisateur.")";

$commd = $db -> prepare($query);
$commd -> execute();

$derncommd= $db -> query('SELECT idCommande FROM commande ORDER BY idCommande DESC LIMIT 1');

$dernid = $derncommd -> fetch();


$pcommd =
"INSERT INTO produitscommande(Commande_idCommande,Produits_idProduits,Quantité,EtatLivraison)  
VALUES (".$dernid['idCommande'].",".$produitCmd.",".$quantite.",\"préparation\")";

$insertion = $db -> prepare($pcommd);
$insertion -> execute();
    
?>
