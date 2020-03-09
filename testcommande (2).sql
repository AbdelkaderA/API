-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  lun. 09 mars 2020 à 09:10
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `testcommande`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
CREATE TABLE IF NOT EXISTS `adresses` (
  `idAdresses` int(11) NOT NULL AUTO_INCREMENT,
  `Rue` varchar(45) DEFAULT NULL,
  `Complement` varchar(45) DEFAULT NULL,
  `CodePostal` varchar(45) DEFAULT NULL,
  `Ville` varchar(45) DEFAULT NULL,
  `Pays` varchar(45) DEFAULT NULL,
  `Nom` varchar(45) DEFAULT NULL,
  `Destinataire` varchar(45) DEFAULT NULL,
  `Utilisateur_idUser` int(11) NOT NULL,
  PRIMARY KEY (`idAdresses`),
  KEY `fk_Adresses_Utilisateur1_idx` (`Utilisateur_idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`idAdresses`, `Rue`, `Complement`, `CodePostal`, `Ville`, `Pays`, `Nom`, `Destinataire`, `Utilisateur_idUser`) VALUES
(21, 'Avenue Jean Jaures', 'Les Capucins', '73000', 'Francin', 'France', 'Domicile', 'ATAMAA', 1),
(22, 'Avenue de la République', 'Les Bleuets', '73022', 'Chambery', 'France', 'Domicile', 'CHAMBARD', 2),
(23, 'Avenue Edouard Daladier', 'Les cyclamens', '73035', 'Albertville', 'France', 'Domicile', 'COLOMBEL', 3),
(24, 'Avenue Paul Louis Merlin', 'Le Compte Rouge', '73048', 'Grenoble', 'France', 'Domicile', 'RIEDINGER', 4),
(25, 'Avenue Jean Moulin', 'Les Gentianes', '73094', 'Grenoble', 'France', 'Domicile', 'BOURGEON', 5);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idCommande` int(11) NOT NULL AUTO_INCREMENT,
  `Adresses_idAdresses` int(11) NOT NULL,
  `Utilisateur_idUser` int(11) NOT NULL,
  `Datedecommande` date NOT NULL,
  PRIMARY KEY (`idCommande`),
  KEY `fk_Commande_Adresses1_idx` (`Adresses_idAdresses`),
  KEY `fk_Commande_Utilisateur1_idx` (`Utilisateur_idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idCommande`, `Adresses_idAdresses`, `Utilisateur_idUser`, `Datedecommande`) VALUES
(1, 21, 1, '2020-02-08'),
(2, 22, 2, '2020-02-08'),
(3, 23, 3, '2020-02-09'),
(4, 24, 4, '2020-02-09'),
(5, 25, 5, '2020-02-09'),
(6, 21, 1, '2020-02-09'),
(7, 22, 2, '2020-02-10'),
(8, 23, 3, '2020-02-10'),
(9, 24, 4, '2020-02-10'),
(10, 25, 5, '2020-02-10'),
(11, 22, 2, '2020-02-12'),
(12, 23, 3, '2020-02-12'),
(13, 23, 3, '2020-02-15'),
(14, 24, 4, '2020-02-18'),
(15, 25, 5, '2020-03-01'),
(16, 22, 2, '2020-03-01'),
(17, 23, 3, '2020-03-04'),
(18, 24, 4, '2020-03-04'),
(19, 21, 1, '2020-03-04'),
(20, 21, 1, '2020-03-04'),
(21, 23, 3, '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `idSiret` int(20) NOT NULL,
  `Nom` varchar(45) DEFAULT NULL,
  `Adresse` varchar(45) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSiret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fournisseurs`
--

INSERT INTO `fournisseurs` (`idSiret`, `Nom`, `Adresse`, `Telephone`, `Email`) VALUES
(1862478516, 'Volley Ballon', 'Zi volley 52560 Chambery', '0599248364', 'volley@ballon.fr'),
(1896316514, 'Foot Ballon', 'Zi foot 42560 Montpelier', '0579448364', 'foot@ballon.fr'),
(1943541641, 'Basket Ballon', 'Zi baset 49560 La Ravoir', '0579148364', 'basket@ballon.fr'),
(1985165122, 'Tenis Ballon', 'Zi tenis 44560 Lier', '0579248864', 'tenis@ballon.fr'),
(1996546846, 'Hand Ballon', 'Zi hand 42580 Pelier', '0579245364', 'hand@ballon.fr'),
(2147483647, 'Rugby Ballon', 'Zi rugby 42660 Mont', '0579283645', 'rugby@ballon.fr');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `idProduits` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) DEFAULT NULL,
  `Prix` varchar(45) DEFAULT NULL,
  `Poids` varchar(45) DEFAULT NULL,
  `EtatStock` varchar(45) DEFAULT NULL,
  `Categorie` varchar(45) DEFAULT NULL,
  `Stock` varchar(45) DEFAULT NULL,
  `Fournisseurs_idSiret` int(11) NOT NULL,
  PRIMARY KEY (`idProduits`),
  KEY `fk_Produits_Fournisseurs1_idx` (`Fournisseurs_idSiret`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`idProduits`, `Nom`, `Prix`, `Poids`, `EtatStock`, `Categorie`, `Stock`, `Fournisseurs_idSiret`) VALUES
(1, 'Ballon PSG', '21', '450g', 'Stock OK', 'Foot', '200', 1896316514),
(2, 'Ballon OL', '52.5', '450g', 'Reapprovisionnement', 'Foot', '0', 1896316514),
(3, 'Ballon OM', '15.75', '450g', 'Stock OK', 'Foot', '170', 1896316514),
(4, 'Ballon Lille', '5.25', '450g', 'Stock OK', 'Foot', '200', 1896316514),
(5, 'Ballon Montmelian', '30', '550g', 'Stock OK', 'Rugby', '145', 2147483647),
(6, 'Ballon France', '40', '550g', 'Stock OK', 'Rugby', '125', 2147483647),
(7, 'Ballon Toulouse', '20', '550g', 'Stock OK', 'Rugby', '112', 2147483647),
(8, 'Ballon Grenoble', '10', '550g', 'Stock OK', 'Rugby', '185', 2147483647),
(9, 'Ballon NBA', '50', '650g', 'Reapprovisionnement', 'Basket', '0', 1943541641),
(10, 'Ballon France', '40', '650g', 'Stock OK', 'Basket', '145', 1943541641),
(11, 'Ballon Lakers', '20', '650g', 'Stock OK', 'Basket', '132', 1943541641),
(12, 'Ballon Chicago Bulls', '10', '650g', 'Stock OK', 'Basket', '124', 1943541641),
(13, 'Ballon Rouge', '40', '250g', 'Stock OK', 'Volley', '154', 1862478516),
(14, 'Ballon Noir', '25', '250g', 'Stock OK', 'Volley', '168', 1862478516),
(15, 'Ballon Blanc', '15', '250g', 'Reapprovisionnement', 'Volley', '0', 1862478516),
(16, 'Ballon Jaune', '30', '250g', 'Stock OK', 'Volley', '159', 1862478516),
(17, 'Balle Vert', '3', '50g', 'Stock OK', 'Tenis', '105', 1985165122),
(18, 'Balle Jaune', '5', '50g', 'Stock OK', 'Tenis', '106', 1985165122),
(19, 'Balle Simple', '1', '50g', 'Reapprovisionnement', 'Tenis', '0', 1985165122),
(20, 'Balle Signé', '8', '50g', 'Stock OK', 'Tenis', '110', 1985165122),
(21, 'Ballon Chambery', '10', '150g', 'Reapprovisionnement', 'Hand', '0', 1996546846),
(22, 'Ballon France', '25', '150g', 'Stock OK', 'Hand', '154', 1996546846),
(23, 'Ballon PSG', '30', '150g', 'Stock OK', 'Hand', '150', 1996546846),
(24, 'Balle de pingpong', '7', '2g', 'Stock bon', 'Tenis', '1245', 1985165122);

-- --------------------------------------------------------

--
-- Structure de la table `produitscommande`
--

DROP TABLE IF EXISTS `produitscommande`;
CREATE TABLE IF NOT EXISTS `produitscommande` (
  `Commande_idCommande` int(11) NOT NULL,
  `Produits_idProduits` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Quantité` int(11) DEFAULT NULL,
  `EtatLivraison` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Commande_has_Produits_Produits1_idx` (`Produits_idProduits`),
  KEY `fk_Commande_has_Produits_Commande1_idx` (`Commande_idCommande`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produitscommande`
--

INSERT INTO `produitscommande` (`Commande_idCommande`, `Produits_idProduits`, `id`, `Quantité`, `EtatLivraison`) VALUES
(1, 10, 24, 9, 'Preparation'),
(1, 5, 25, 4, 'Preparation'),
(1, 8, 26, 6, 'Preparation'),
(2, 4, 27, 8, 'Envoyer'),
(2, 14, 28, 6, 'Envoyer'),
(2, 13, 29, 2, 'Envoyer'),
(4, 20, 30, 8, 'Envoyer'),
(4, 19, 31, 9, 'Envoyer'),
(5, 23, 32, 4, 'Envoyer'),
(5, 22, 33, 6, 'Envoyer'),
(6, 6, 34, 6, 'Preparation'),
(7, 5, 35, 6, 'Preparation'),
(8, 9, 36, 6, 'Preparation'),
(9, 15, 37, 25, 'Preparation'),
(10, 17, 38, 34, 'Preparation'),
(11, 18, 39, 37, 'Preparation'),
(12, 22, 40, 32, 'Preparation'),
(13, 11, 41, 25, 'Preparation'),
(14, 14, 42, 22, 'Preparation'),
(15, 16, 43, 45, 'Preparation'),
(16, 7, 44, 44, 'Preparation'),
(17, 9, 45, 60, 'Preparation'),
(18, 6, 46, 50, 'Preparation'),
(19, 5, 50, 9, 'Preparation'),
(21, 23, 52, 2, 'Préparation'),
(21, 22, 53, 2, 'Préparation'),
(21, 21, 54, 2, 'Préparation');

-- --------------------------------------------------------

--
-- Structure de la table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
CREATE TABLE IF NOT EXISTS `promotions` (
  `idPromotions` int(11) NOT NULL AUTO_INCREMENT,
  `DateDebut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  `Reduction` double DEFAULT NULL,
  `Produits_idProduits` int(11) NOT NULL,
  PRIMARY KEY (`idPromotions`),
  KEY `fk_Promotions_Produits_idx` (`Produits_idProduits`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `promotions`
--

INSERT INTO `promotions` (`idPromotions`, `DateDebut`, `DateFin`, `Reduction`, `Produits_idProduits`) VALUES
(1, '2020-03-01', '2020-03-26', 0.8, 3),
(2, '2020-03-01', '2020-03-26', 0.8, 10),
(3, '2020-03-01', '2020-03-26', 0.8, 20),
(4, '2020-05-01', '2020-05-29', 0.6, 3),
(5, '2020-05-01', '2020-05-29', 0.6, 5);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) DEFAULT NULL,
  `Prenom` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `MDP` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUser`, `Nom`, `Prenom`, `Email`, `MDP`) VALUES
(1, 'Atamaa', 'Abdelkader', 'aaaaa@aaaa.fr', '1111'),
(2, 'Chambard', 'Ulys', 'ccccc@uuuu.fr', '2222'),
(3, 'Colombel', 'Théo', 'ccccc@tttt.fr', '3333'),
(4, 'Riedinger', 'Marie-laure', 'rrrrr@mmmm.fr', '4444'),
(5, 'Bourgeon', 'Virginie', 'bbbbb@vvvv.fr', '5555');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `fk_Adresses_Utilisateur1` FOREIGN KEY (`Utilisateur_idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_Commande_Adresses1` FOREIGN KEY (`Adresses_idAdresses`) REFERENCES `adresses` (`idAdresses`),
  ADD CONSTRAINT `fk_Commande_Utilisateur1` FOREIGN KEY (`Utilisateur_idUser`) REFERENCES `utilisateur` (`idUser`);

--
-- Contraintes pour la table `produitscommande`
--
ALTER TABLE `produitscommande`
  ADD CONSTRAINT `fk_Commande_has_Produits_Commande1` FOREIGN KEY (`Commande_idCommande`) REFERENCES `commande` (`idCommande`),
  ADD CONSTRAINT `fk_Commande_has_Produits_Produits1` FOREIGN KEY (`Produits_idProduits`) REFERENCES `produits` (`idProduits`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
