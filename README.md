# Modifier db_connect.php avec vos parametres de connection !!



## Afficher produits par categorie 



> ### Pour Afficher les produits de catégorie XXX : 
> DONNEEProduit.php?categorie=XXX 
    
## Nouvelle commande 

Modifier **post.php** 
> modifier les champs Adresses_idAdresses => **l'id de votre adresse (int)**   
> modifier Utilisateur_idUser => **votre id d'utilisateur (int )  **  
> modifier Produits_idProduits => ** l'id du produit à commander (int)**  
> modifier Quantité => **La quantité à commander (int)**  

## Pour récupérer l'historique de vos commandes  :

> Allez à -> getCommands.php?user=** Votre id d'utilisateur **

## Modifier votre commande 

### Pour supprimer une commande 

> Allez à -> modif.php?idCommande=**L'id de votre commande**&delete=true

### Pour modifier la quantité commandée d'un article

> Allez à modif.php?idCommande=**L'id de votre commande**&idProduits=**L'id de votre produit a modifier**&newq=**La nouvelle quantité**
