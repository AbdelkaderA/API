<?php
session_start();
  if(!empty($_SESSION['user'])){
     if (isset($_GET['idCommande']) && isset($_GET['delete'])) // Si idCommande et delete sont paramétré 
       {
       		 $db = new PDO('mysql:host=localhost;port=3308;dbname=testcommande','root',''); //On se connecte a la BDD
           $reponse = $db->prepare('DELETE FROM commande WHERE idCommande= ? AND Utilisateur_idUser = ?'); //Premiére requête pour supprimer l'idCommande 
            $reponse1 = $db->prepare('DELETE FROM produitscommande WHERE Commande_idCommande= ?');
            
       		 $reponse->execute(array($_GET['idCommande'], $_SESSION['user']));
            $reponse1->execute(array($_GET['idCommande']));

            $done[] = true ;
            header('Content-Type: application/json');  // On renvoie le code en JSON 
            echo json_encode($done, JSON_PRETTY_PRINT);
       }

     elseif (isset($_GET['idCommande']) && isset($_GET['idProduits']) && isset($_GET['newq'])) 

     {

        $db = new PDO('mysql:host=localhost;port=3308;dbname=testcommande','root','');
        $update = $db->query('UPDATE produitscommande SET Quantité = '.$_GET['newq'].' WHERE  Commande_idCommande = '.$_GET['idCommande'].' AND Produits_idProduits = '.$_GET['idProduits'] );

        $done[] = true ;
        header('Content-Type: application/json');  // On renvoie le code en JSON 
        echo json_encode($done, JSON_PRETTY_PRINT);
     } 
  }
  else {
    $wu[] = "Wrong user !";
    header('Content-Type: application/json');  // On renvoie le code en JSON 
    echo json_encode($wu, JSON_PRETTY_PRINT);
  }
     ?>
     
