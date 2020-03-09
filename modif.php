<?php
     if (isset($_GET['idCommande']) && isset($_GET['delete'])) // Si idCommande et delete sont paramétré 
       {
       		 $db = new PDO('mysql:host=localhost;port=3308;dbname=testcommande','test','test'); //On se connecte a la BDD
           $reponse = $db->prepare('DELETE FROM commande WHERE idCommande= ?'); //Premiére requête pour supprimer l'idCommande 
       		 $reponse1 = $db->prepare('DELETE FROM produitscommande WHERE Commande_idCommande= ?');
       		  echo $reponse->execute(array($_GET['idCommande']));

       		 $reponse1->execute(array($_GET['idCommande']));
       }

     elseif (isset($_GET['idCommande']) && isset($_GET['idProduits']) && isset($_GET['newq'])) 

     {

        $db = new PDO('mysql:host=localhost;port=3308;dbname=testcommande','test','test');
        $update = $db->query('UPDATE produitscommande SET Quantité = '.$_GET['newq'].' WHERE  Commande_idCommande = '.$_GET['idCommande'].' AND Produits_idProduits = '.$_GET['idProduits'] );

     } 

     ?>
     