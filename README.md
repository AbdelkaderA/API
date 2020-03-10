# Modifier db_connect.php avec vos parametres de connection !!



## Afficher produits par categorie 



> ### Pour Afficher les produits de catégorie XXX : 
> DONNEEProduit.php?categorie=XXX 
    
## Nouvelle commande 

Modifier **post.php** 
> modifier les champs Adresses_idAdresses => **l'id de votre adresse (int)**  (21)     
> modifier Utilisateur_idUser => **votre id d'utilisateur (int )**  (7)     
> modifier Produits_idProduits => **l'id du produit à commander (int)**  (4)     
> modifier Quantité => **La quantité à commander (int)**  (5)     

## Pour récupérer l'historique de vos commandes  :

> Allez à -> getCommands.php?user=**Votre id d'utilisateur**     

## Modifier votre commande 

### Pour supprimer une commande 

> Allez à -> modif.php?idCommande=**L'id de votre commande**&delete=true

### Pour modifier la quantité commandée d'un article

> Allez à modif.php?idCommande=**L'id de votre commande**&idProduits=**L'id de votre produit a modifier**&newq=**La nouvelle quantité**
