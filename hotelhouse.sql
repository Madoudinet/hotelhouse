-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 08 sep. 2023 à 16:19
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hotelhouse`
--

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `commantaire` longtext NOT NULL,
  `note` int(11) NOT NULL,
  `date_enregistrement` datetime NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `avis`
--

INSERT INTO `avis` (`id`, `nom`, `prenom`, `commantaire`, `note`, `date_enregistrement`, `category`) VALUES
(1, 'test', 'test', 'La suite incarne l\'élégance, le confort et le raffinement pour ceux qui recherchent une expérience de séjour inoubliable. Que ce soit pour un voyage d\'affaires ou une escapade romantique, cette suite vous offrira un cadre somptueux pour votre séjour.', 2, '2023-09-07 11:35:15', 'Chambre'),
(2, 'Dupont', 'Olivier', 'Une expérience culinaire exceptionnelle ! La cuisine était délicieuse, le service impeccable et l\'ambiance chaleureuse. À recommander sans hésitation !', 4, '2023-09-07 12:07:25', 'Restaurant');

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description_courte` varchar(255) NOT NULL,
  `description_longue` longtext NOT NULL,
  `photo` varchar(255) NOT NULL,
  `prix_journalier` int(11) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`id`, `titre`, `description_courte`, `description_longue`, `photo`, `prix_journalier`, `date_enregistrement`) VALUES
(1, 'Classique', 'Élégante et apaisante, lit confortable, salle de bains impeccable, coin salon, équipements modernes, vue magnifique, ambiance accueillante.', '<div>Notre chambre classique incarne l\'essence même du confort et de la simplicité. Dotée d\'un design élégant et intemporel, elle offre une atmosphère chaleureuse et accueillante pour votre séjour.<br><br></div><div>Le lit confortable, habillé de draps frais et d\'oreillers moelleux, promet des nuits de sommeil paisibles. Vous pourrez vous détendre en regardant la télévision à écran plat ou en utilisant notre connexion Wi-Fi haut débit gratuite pour rester connecté.<br><br></div><div>Les grandes fenêtres inondent la chambre de lumière naturelle et offrent une vue agréable sur les environs. Vous pourrez vous installer dans un coin lecture avec un bon livre ou simplement vous perdre dans la contemplation du paysage.<br><br></div><div>La salle de bains privative est équipée d\'une douche ou d\'une baignoire, ainsi que de produits de toilette de qualité pour votre bien-être.<br><br></div><div>Un minibar bien approvisionné est à votre disposition pour satisfaire vos envies de rafraîchissements ou de collations à toute heure.<br><br></div><div>La chambre classique incarne la simplicité élégante et le confort pour les voyageurs qui recherchent un séjour agréable sans fioritures inutiles. C\'est l\'endroit parfait pour se reposer après une journée bien remplie ou pour une escapade paisible.<br><br></div>', '1694011319-pexels-lukas-rychvalsky-2889618.jpg', 95, '2023-09-05 14:09:08'),
(2, 'Confort', 'Lit douillet, décoration apaisante, salle de bains moderne, coin salon relaxant, équipements de qualité, ambiance chaleureuse, idéale pour se détendre et se ressourcer.', '<div>Notre chambre confort est un véritable havre de tranquillité et de détente. Avec son design élégant et apaisant, elle offre l\'endroit idéal pour échapper au stress quotidien.<br><br></div><div>Dotée d\'un lit king-size moelleux, vous vous sentirez immédiatement enveloppé dans un cocon de douceur dès que vous vous allongerez. Les draps frais et les oreillers moelleux vous garantissent une nuit de sommeil réparateur.<br><br></div><div>La chambre est baignée de lumière naturelle grâce à de grandes fenêtres qui offrent une vue apaisante sur le jardin ou la ville. Vous pourrez profiter de cette vue tout en vous relaxant dans un fauteuil confortable avec un bon livre ou une tasse de thé.<br><br></div><div>Pour votre divertissement, une télévision à écran plat est à votre disposition, ainsi qu\'une connexion Wi-Fi rapide pour rester connecté avec le monde extérieur.<br><br></div><div>La salle de bains attenante est équipée d\'une douche à effet pluie rafraîchissante et de produits de toilette de qualité pour votre bien-être.<br><br></div><div>Pour compléter votre séjour, la chambre est équipée d\'un minibar bien approvisionné, et vous pourrez également profiter du service en chambre si vous préférez savourer un repas ou une boisson dans le confort de votre chambre.<br><br></div><div>En somme, notre chambre confort est le choix parfait pour les voyageurs en quête de détente, d\'élégance et de confort, où chaque détail est pensé pour rendre votre séjour des plus agréables.<br><br></div>', '1693989008-pexels-pixabay-164595.jpg', 120, '2023-09-06 10:30:08'),
(3, 'Suite', 'Spacieuse, chambre séparée avec lit king-size, salon élégant, salle de bains somptueuse, équipements haut de gamme, vue panoramique, idéale pour les séjours romantiques ou les voyageurs exigeants.', '<div>Notre suite est le summum du luxe et du confort. Avec un espace généreux et des finitions élégantes, elle offre une expérience de séjour exceptionnelle.<br><br></div><div>La chambre principale est meublée d\'un lit king-size luxueux, habillé de draps de qualité supérieure pour vous offrir un sommeil profond et réparateur. La salle de séjour attenante est spacieuse, dotée d\'un coin salon confortable, d\'une télévision à écran plat, et d\'une vue panoramique imprenable sur les environs.<br><br></div><div>La salle de bains privative est une oasis de détente, avec une baignoire profonde et une douche à effet pluie pour vous dorloter. Des produits de toilette haut de gamme sont à votre disposition pour votre bien-être.<br><br></div><div>La suite dispose également d\'un espace de travail dédié avec un bureau, une connexion Wi-Fi haut débit gratuite et une station de recharge pour rester productif en toute tranquillité.<br><br></div><div>Pour vos besoins en matière de restauration, un minibar bien approvisionné est à votre disposition, et notre service en chambre est disponible 24h/24 pour satisfaire vos préférences culinaires.<br><br></div><div>Profitez également d\'un accès exclusif à nos espaces communs, tels que la salle de fitness, le spa, ou la piscine, pour compléter votre expérience de luxe.<br><br></div><div>La suite incarne l\'élégance, le confort et le raffinement pour ceux qui recherchent une expérience de séjour inoubliable. Que ce soit pour un voyage d\'affaires ou une escapade romantique, cette suite vous offrira un cadre somptueux pour votre séjour.<br><br></div>', '1693989046-pexels-f-h-2747901.jpg', 150, '2023-09-06 10:30:45');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `chambre_id` int(11) NOT NULL,
  `date_arrivee` datetime NOT NULL,
  `date_depart` datetime NOT NULL,
  `prix_total` int(11) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `chambre_id`, `date_arrivee`, `date_depart`, `prix_total`, `prenom`, `nom`, `telephone`, `email`, `date_enregistrement`) VALUES
(2, 2, '2023-09-21 00:00:00', '2023-09-29 00:00:00', 1080, 'Prénom 1', 'nom 1', '01 23 45 67 89', 'prenom@nom.com', '2023-09-06 12:33:27'),
(3, 3, '2023-09-30 00:00:00', '2023-10-01 00:00:00', 300, 'John', 'Doe', '98 76 54 32 10', 'john@doe.com', '2023-09-06 14:11:27'),
(4, 2, '2023-09-21 00:00:00', '2023-09-28 00:00:00', 960, 'test', 'test', '456434', 'test@test.com', '2023-09-06 14:20:45'),
(5, 2, '2023-09-14 00:00:00', '2023-09-22 00:00:00', 1080, 'Daryl', 'Dixon', '0800 555 123', 'daryl@hotmail.fr', '2023-09-07 16:13:18'),
(6, 1, '2023-09-09 00:00:00', '2023-09-10 00:00:00', 190, 'Denis', 'Test', '4661611819', 'erag@zgzrga.com', '2023-09-08 14:23:03');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230905093554', '2023-09-05 11:36:00', 87),
('DoctrineMigrations\\Version20230906120902', '2023-09-06 14:09:12', 64),
('DoctrineMigrations\\Version20230907090030', '2023-09-07 11:00:37', 35);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `ordre` int(11) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `slider`
--

INSERT INTO `slider` (`id`, `photo`, `ordre`, `date_enregistrement`) VALUES
(1, '1694008105-pexels-pixabay-164595.jpg', 1, '2023-09-05 14:01:25'),
(2, '1694008118-pexels-kaboompics-com-6267.jpg', 2, '2023-09-05 15:01:29'),
(3, '1694008127-pexels-pavel-danilyuk-6667425.jpg', 3, '2023-09-06 10:31:40');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `civilite` varchar(255) NOT NULL,
  `date_enregistrement` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `pseudo`, `nom`, `prenom`, `civilite`, `date_enregistrement`) VALUES
(2, 'admin@admin.com', '[]', '$2y$13$6REr7/oAmEB3ZnxZ8t9yWuEnFnFuxkzmQBIb51N8WXUkIvdv14vKO', 'admin', 'admin', 'admin', 'Homme', '2023-09-06 09:48:37'),
(3, 'test@gmail.com', '[]', '$2y$13$gh9VUpmHuKXVwEkKfciYouqkqyCwnQsbKXHNf0UXQefKN/ZRMsdQO', 'Mad', 'Durand', 'Maxime', 'Homme', '2023-09-07 16:05:18');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EEAA67D9B177F54` (`chambre_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avis`
--
ALTER TABLE `avis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67D9B177F54` FOREIGN KEY (`chambre_id`) REFERENCES `chambre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
