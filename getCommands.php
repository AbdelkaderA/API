<?php
session_start();
include 'db_connect.php';

if(!empty($_SESSION['user'])){

    $db = db_connect() ;
    
    $id = $_SESSION['user'] ;
    
    $cmds = $db->query('SELECT * FROM commande WHERE Utilisateur_idUser='.$id);
    
    $commands = Array();
    
    while($row = $cmds->fetch()){
        $commands[$row['idCommande']] = Array();
    
        $items = $db->query('SELECT Quantité, Nom, Prix, idProduits FROM produitscommande
                            INNER JOIN commande ON Commande_idCommande=idCommande
                            INNER JOIN produits ON Produits_idProduits=idProduits
                            WHERE Commande_idCommande='.$row["idCommande"]);
        
        while($itm = $items->fetch()){
            $commands[$row['idCommande']][] = ['nom'=>$itm['Nom'], 'qty' => $itm['Quantité'], 'price' => $itm['Prix'], $itm['idProduits'] ];
        }
       $commands[$row['idCommande']]['date'] = $row['Datedecommande'];
    }
    header('Content-Type: application/json');
    echo json_encode($commands, JSON_PRETTY_PRINT);

}
else {
    $wu[] = "Wrong user !";
    header('Content-Type: application/json');  // On renvoie le code en JSON 
    echo json_encode($wu, JSON_PRETTY_PRINT);
}
