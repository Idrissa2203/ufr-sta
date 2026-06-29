-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 29 juin 2026 à 21:17
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ufr_sta`
--
CREATE DATABASE IF NOT EXISTS `ufr_sta` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ufr_sta`;

-- --------------------------------------------------------

--
-- Structure de la table `activites`
--

DROP TABLE IF EXISTS `activites`;
CREATE TABLE `activites` (
  `id` int(11) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `type_activite` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `lieu` varchar(150) DEFAULT NULL,
  `organisateur` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cree_le` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `actualites`
--

DROP TABLE IF EXISTS `actualites`;
CREATE TABLE `actualites` (
  `id` int(11) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `cree_le` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mot_de_passe_hash` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `cree_le` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `albums`
--

DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `titre` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

DROP TABLE IF EXISTS `departements`;
CREATE TABLE `departements` (
  `id` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `responsable` varchar(150) DEFAULT NULL,
  `contact` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`id`, `nom`, `description`, `responsable`, `contact`) VALUES
(1, 'Mathématiques, Informatique et Modélisation', 'Composé de deux filières: Mathematiques, Physique et Informatique (MPI), et de Mathématiques et Informatique Appliquées aux sciences sociales (MIASS)', 'Dr SOW', 'chef-departement-mim@uam.edu.sn'),
(2, 'Sciences de la Matière et de l\'Univers', 'Composé de deux filières: Sciences de la Mer et du Littoral (SML), et de Physique et Applications (PA)', 'Dr NDAO', 'chef-departement-smu@uam.edu.sn');

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
--

DROP TABLE IF EXISTS `enseignants`;
CREATE TABLE `enseignants` (
  `id` int(11) NOT NULL,
  `departement_id` int(11) DEFAULT NULL,
  `nom` varchar(150) NOT NULL,
  `grade` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `domaines_recherche` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enseignants`
--

INSERT INTO `enseignants` (`id`, `departement_id`, `nom`, `grade`, `email`, `domaines_recherche`, `photo`) VALUES
(1, 1, 'Amadou Dahirou Gueye', 'Professeur Titulaire-Enseignant-chercheur en Informatique', 'dahirou.gueye@uam.edu.sn', '\n-  Télé-laboratoires et Organisations virtuelles\n-  Télé-enseignement\n-  Intelligence artificielle appliquée à la santé, la sécurité routière, l\'éducation et l\'environnement\n-  Internet des Objets et Cloud\n', ''),
(2, 1, 'Alioune Coulibaly', 'Maitre de Conférences Titulaire - Enseignant-chercheur en Mathématiques appliquées(Méthodes aléatoir', 'alioune.coulibaly@uam.edu.sn', '\n__Equations aux dérivées partielles - Equations différentielles stochastiques;\n__Analyse fonctionnelle;\n__Probabilité - Statistique;\n__Systèmes dynamiques;\n__Calcul stochastique;\n', ''),
(3, 1, 'Thierno Mohamadane Mansour Sow', 'Maitre de conférences Titulaire - Enseignant-chercheur en Mathématiques Appliquées', 'thierno.sow@uam.edu.sn', '\n	_Analyse Non linéaire_;\n	_Géométrie des Espaces de Banach_;\n	_Optimisation et méthodes itératives_;\n	_Analyse Fonctionnelle_;\n	_Calcul des Variations_;\n', ''),
(4, 2, 'Issa Sakho', 'Professeur assimilé - Enseignant-chercheur en Géosciences marines et littorales', 'issa.sakho@uam.edu.sn', '\n__ Dynamique physique des systèmes sédimentaires littoraux;\n__ Transfert de matières dans les grands hydro-systèmes: de la source à la mer;\n__ Dynamique et fonctionnement des écosystèmes de carbone bleu: mangroves et herbiers marins.\n', ''),
(5, 2, 'Siny Ndoye', 'Maitre de Conférences Titulaire - Enseignant-chercheur en Physique: Océanographie et Applications', 'siny.ndoye@uam.edu.sn', '\n__	Modélisation hydrodynamique de l\'environnement marin et côtier;\n__	Changement climatique et Evènements extrêmes ;\n__	Pollution marine et dimensionnement d\'émissaire en mer ;\n__	Dynamique océanique ;\n__	Dynamique de l\'Upwelling côtier ouest africain.\n', ''),
(6, 2, 'Makha Ndao', 'Maitre de Conférences Titulaire - Enseignant-chercheur en Nanosciences Nanotechnologie Matériaux', 'makha.ndao@uam.edu.sn', '\n*Biomasse et stockage d\'énergie et traitement des eaux ;\n*Polymères et élastomères pour l\'industrie ;\n*Pollution marine par les microplastiques ;\n*Qualité des eaux et traitements ;\n', '');

-- --------------------------------------------------------

--
-- Structure de la table `formations`
--

DROP TABLE IF EXISTS `formations`;
CREATE TABLE `formations` (
  `id` int(11) NOT NULL,
  `departement_id` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `niveau` varchar(50) DEFAULT NULL,
  `duree` varchar(50) DEFAULT NULL,
  `conditions_admission` text DEFAULT NULL,
  `debouches` text DEFAULT NULL,
  `programme` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `formations`
--

INSERT INTO `formations` (`id`, `departement_id`, `nom`, `niveau`, `duree`, `conditions_admission`, `debouches`, `programme`) VALUES
(1, 1, 'Licence Mathématiques et Modélisation', 'Licence', '3 ans', 'BAC S et equivalent', 'Enseignement, Finance, Economie, Recherche...', '\n<h3>Semestre 1 </h3>\n<ul>\n	<li> Mathématiques 1 </li>\n	<li> Physique 1 </li>\n	<li> Informatique 1 </li>\n	<li> Outils de base 1 </li>\n</ul>\n<h3>Semestre 2 </h3>\n<ul>\n	<li>Mathématiques 2 </li>\n	<li>Physique 2 </li>\n	<li>Informatique 2 </li>\n	<li>Outlis de base 2 </li>\n</ul>\n<h3>Semestre 3 </h3>\n<ul>\n	<li> Mathématiques 3 </li>\n	<li> Physique 3 </li>\n	<li> Informatique 3 </li>\n	<li> Outils de base 3 </li>\n</ul>\n<h3>Semestre 4 </h3>\n<ul>\n	<li>Mathématiques 4 </li>\n	<li>Physique 4 </li>\n	<li>Informatique 4 </li>\n	<li>Outils de base 4 </li>\n	<li>Analyse du signal </li>\n</ul>\n<h3>Semestre 5 </h3>\n<ul>\n	<li>Mathématiques 5.1 </li>\n	<li>Mathématiques 5.2 </li>\n	<li>Informatique 5 </li>\n	<li>Humanités </li>\n</ul>\n<h3>Semestre 6 </h3>\n<ul>\n	<li>Mathématiques 6.1 </li>\n	<li>Mathématiques 6.2 </li>\n	<li>Informatique 4 </li>\n</ul>\n'),
(2, 1, 'Licence Informatique', 'Licence', '3 ans', 'BAC S et equivalent', 'Développeur, Enseignant, Cybersécurité, Administrateur réseaux et systèmes', '\n<h3>Semestre 1</h3>\n<ul><li> TRONC COMMUN AVEC LA LICENCE MATHEMATIQUES ET MODELISATION</li></ul>\n<h3>Semestre 2</h3>\n<ul><li> TRONC COMMUN AVEC LA LICENCE MATHEMATIQUES ET MODELISATION</li></ul>\n<h3>Semestre 3</h3>\n<ul><li> TRONC COMMUN AVEC LA LICENCE MATHEMATIQUES ET MODELISATION</li></ul>\n<h3>Semestre 4</h3>\n<ul><li> TRONC COMMUN AVEC LA LICENCE MATHEMATIQUES ET MODELISATION</li></ul>\n<h3>Semestre 5</h3>\n');

-- --------------------------------------------------------

--
-- Structure de la table `messages_contact`
--

DROP TABLE IF EXISTS `messages_contact`;
CREATE TABLE `messages_contact` (
  `id` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `sujet` varchar(200) DEFAULT NULL,
  `message` text NOT NULL,
  `envoye_le` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activites`
--
ALTER TABLE `activites`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `actualites`
--
ALTER TABLE `actualites`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departement_id` (`departement_id`);

--
-- Index pour la table `formations`
--
ALTER TABLE `formations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departement_id` (`departement_id`);

--
-- Index pour la table `messages_contact`
--
ALTER TABLE `messages_contact`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activites`
--
ALTER TABLE `activites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `actualites`
--
ALTER TABLE `actualites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `departements`
--
ALTER TABLE `departements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `enseignants`
--
ALTER TABLE `enseignants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `formations`
--
ALTER TABLE `formations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `messages_contact`
--
ALTER TABLE `messages_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD CONSTRAINT `enseignants_ibfk_1` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`id`);

--
-- Contraintes pour la table `formations`
--
ALTER TABLE `formations`
  ADD CONSTRAINT `formations_ibfk_1` FOREIGN KEY (`departement_id`) REFERENCES `departements` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
