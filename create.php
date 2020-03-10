<?php
session_start();
if(!empty($_SESSION['user'])){

    include 'db_connect.php' ;
    
    $db = db_connect();
    
    $adresses = $_POST ["Adresses_idAdresses"];
    $utilisateur = $_SESSION['user'];
    $produitCmd = $_POST ["Produits_idProduits"];
    $quantite = $_POST ["Quantité"];
    
    
    $query = 
    "INSERT INTO commande (Adresses_idAdresses, Utilisateur_idUser, Datedecommande) 
    VALUES (".$adresses.",".$utilisateur.", CURDATE())";
    
    $commd = $db -> prepare($query);
    $commd -> execute();
    
    $derncommd= $db -> query('SELECT idCommande FROM commande ORDER BY idCommande DESC LIMIT 1');
    
    $dernid = $derncommd -> fetch();
    
    
    $pcommd =
    "INSERT INTO produitscommande(Commande_idCommande,Produits_idProduits,Quantité,EtatLivraison)  
    VALUES (".$dernid['idCommande'].",".$produitCmd.",".$quantite.",\"préparation\")";
    
    $insertion = $db -> prepare($pcommd);
    $insertion -> execute();
    
    $done[] = true ;
    header('Content-Type: application/json');  // On renvoie le code en JSON 
    echo json_encode($done, JSON_PRETTY_PRINT);

}
else {
    $wu[] = "Wrong user !";
    header('Content-Type: application/json');  // On renvoie le code en JSON 
    echo json_encode($wu, JSON_PRETTY_PRINT);
}
?>
