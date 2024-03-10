-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 10 mars 2024 à 10:36
-- Version du serveur : 5.7.19-log
-- Version de PHP : 8.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `imie_actunews`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_64C19C1727ACA70` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `slug`) VALUES
(1, 3, 'Longboard', 'longboard'),
(2, NULL, 'Shortboard', 'shortboard'),
(3, NULL, 'Surf', 'surf'),
(4, NULL, 'Matos', 'matos');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CA76ED395` (`user_id`),
  KEY `IDX_9474526C4B89032C` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `post_id`, `content`, `created_at`) VALUES
(1, 1, 1, 'Commentaire 1', '2023-04-12 10:17:19'),
(3, 3, 1, 'Commentaire 3', '2023-04-12 11:45:25'),
(4, 2, 2, 'Le premier commentaire', '2023-04-13 09:15:44'),
(5, 1, 4, 'Premier commentaire', '2023-05-16 07:28:26'),
(6, 1, 4, 'Deuxième commentaire', '2023-05-16 07:28:37'),
(7, 1, 4, 'Troisième commentaire', '2023-05-16 07:28:51'),
(8, 1, 4, 'Quatrième commentaire', '2023-05-16 07:29:02'),
(9, 1, 4, 'Cinquième commentaire', '2023-05-16 07:29:18'),
(10, 2, 1, 'test', '2023-05-17 12:16:23');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230220135525', '2023-02-20 14:05:12', 844),
('DoctrineMigrations\\Version20230220150623', '2023-02-20 15:09:29', 798),
('DoctrineMigrations\\Version20230221084651', '2023-02-21 08:49:15', 1482),
('DoctrineMigrations\\Version20230221105706', '2023-02-21 10:57:48', 1065),
('DoctrineMigrations\\Version20230221123456', '2023-02-21 12:36:49', 1268),
('DoctrineMigrations\\Version20230221125813', '2023-02-21 12:59:49', 2556),
('DoctrineMigrations\\Version20230221144950', '2023-02-21 14:50:02', 867),
('DoctrineMigrations\\Version20230412093504', '2023-04-12 09:41:23', 3592),
('DoctrineMigrations\\Version20230515075824', '2023-05-15 07:59:24', 5769),
('DoctrineMigrations\\Version20230515085423', '2023-05-15 08:55:13', 1008);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `active` tinyint(1) NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_size` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8DA76ED395` (`user_id`),
  KEY `IDX_5A8A6C8D12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `user_id`, `category_id`, `title`, `slug`, `content`, `created_at`, `active`, `image_name`, `image_size`, `updated_at`) VALUES
(1, 1, 1, '12 RAISONS DE PARTIR SURFER AU NICARAGUA', '12-raisons-de-partir-surfer-au-nicaragua', '<p>POURQUOI LE NICARAGUA FAIT-IL AUTANT PARLER DE LUI ? Le Nicaragua vivait des heures sombres alors que son voisin, le Costa Rica et son image de destination touristique &agrave; la mode, se transformait en refuge pour retrait&eacute;s am&eacute;ricains et europ&eacute;ens. Depuis, son image de pays troubl&eacute; lui a coll&eacute; &agrave; la peau, laissant ses plages intactes et ses vagues vierges. Depuis la fin des ann&eacute;es 90, le pays est rest&eacute; fig&eacute; et il commence seulement &agrave; se r&eacute;veiller. Avec sa c&ocirc;te, consid&eacute;r&eacute;e comme l&rsquo;une des plus consistante au monde, c&rsquo;est aujourd&rsquo;hui un paradis pour les surfeurs. Partir surfer au Nicaragua, c&rsquo;est partir dans un lieu hors du temps. 1 - LA QUALIT&Eacute; DES VAGUES Le Nicaragua jouit d&rsquo;une position parfaite, l&eacute;g&egrave;rement au Nord de l&rsquo;&eacute;quateur, il est l&eacute;g&egrave;rement orient&eacute; vers le sud afin de capter au mieux les houles longues g&eacute;n&eacute;r&eacute;es par les 40&egrave;mes rugissants et les 50&egrave;mes hurlants du large de la Nouvelle Z&eacute;lande. De plus, la mer des Cara&iuml;bes et le lac Nicaragua g&eacute;n&egrave;rent des vents de terre 360 jours par an ! Un cadre id&eacute;al pour des vagues parfaites toute l&rsquo;ann&eacute;e. Partir surfer au Nicaragua c&#39;est l&#39;assurance de conditions de r&ecirc;ve. Consulter notre article sur le surf au Nicaragua. 2 - DES VAGUES POUR TOUS NIVEAUX Ces conditions parfaites sont id&eacute;ales pour le d&eacute;butant souhaitant commencer le surf et s&rsquo;impr&eacute;gner de sa culture. Les niveaux interm&eacute;diaires pourront progresser dans leur pratique sur des vagues vari&eacute;es, en am&eacute;liorant leur lecture de vagues et en augmentant le nombre de vagues par session. Les exp&eacute;riment&eacute;s quant &agrave; eux, vont repousser leurs limites sur des vagues rapides, tubulaires et creuses afin de vivre des moments inoubliables. 3 - PEU DE MONDE &Agrave; L&rsquo;EAU M&ecirc;me si certains spots comme Popoyo ou Maderas peuvent parfois &ecirc;tre consid&eacute;r&eacute;s comme bond&eacute;s avec une trentaine de surfeurs, ils peuvent aussi &ecirc;tre presque d&eacute;serts. De plus, il suffit de partir surfer sur des spots moins connus mais de m&ecirc;me qualit&eacute; pour se retrouver seul avec ses amis ! 4 - PAS DE DANGERS M&ecirc;me si la faune marine est abondante, les eaux du Nicaragua sont s&ucirc;res. C&rsquo;est d&rsquo;ailleurs l&rsquo;un des pays les plus s&ucirc;r au monde en mati&egrave;re de risque requin (http://www.sharkattackdata.com/place). Les principaux dangers potentiels sont des Stingray, &eacute;quivalents des vives du sud ouest.</p>', '2023-02-21 15:21:05', 1, 'img-3571-6461f0e257e5f928453241.jpg', 95271, '2023-05-15 08:44:18'),
(2, 2, 1, 'HOSSEGOR N’GOR, CAPSULE SÉNÉGALAISE', 'hossegor-ngor-capsule-senegalaise', '<p><em><strong>Le voyage est une qu&ecirc;te humaine</strong></em> et un besoin vital pour Chipiron. Une &eacute;vasion commune &agrave; la recherche d&rsquo;ouverture d&rsquo;esprit pour nous et notre surf.&nbsp;A l&rsquo;automne 2021, nous partons retrouver la l&eacute;gende s&eacute;n&eacute;galaise Oumar Sey, le boss de Dakar, premier surfeur pro s&eacute;n&eacute;galais. Avec lui, nous partageons sa culture, ses traditions, ses spots. De ces quelques jours, nous avons ramen&eacute; les fameux tissus wax que nous avons d&eacute;clin&eacute; en planches de surf, en d&eacute;rives, et en tshirts.</p>\r\n\r\n<p>Pour accompagner cette capsule, nous vous faisons voyager &agrave; travers quelqu&rsquo;uns de nos clich&eacute;s de vie.</p>\r\n\r\n<p>Dakar grouille, comme beaucoup de ces m&eacute;galopoles africaines. Trafic, musique, chaleur, sourires, odeurs &eacute;pic&eacute;es, ambiance color&eacute;e,&hellip; tout ce qu&rsquo;on aime de l&rsquo;Afrique. C&rsquo;est certain, nous reviendrons Dakar!</p>\r\n\r\n<p><a href=\"https://www.chipiron.fr/wp-content/uploads/2022/07/hossegor-ngor-senegal-chipiron-surfboards0213-1024x708.jpg\" target=\"_self\"><img alt=\"@chipiron surfboards Sénégal\" src=\"https://www.chipiron.fr/wp-content/uploads/2022/07/hossegor-ngor-senegal-chipiron-surfboards0213-1024x708.jpg\" style=\"height:567px; width:820px\" title=\"hossegor-ngor-senegal-chipiron-surfboards0213\" /></a></p>', '2023-02-23 13:23:11', 1, 'hossegor-ngor-senegal-chipiron-surfboards21770-6461f122bbf67416238441.jpg', 392117, '2023-05-15 08:45:22'),
(3, 1, 4, 'Comment bien poser son pad / grip', 'comment-bien-poser-son-pad-grip', '<p>Etape importante, on a toujours un peu d&rsquo;appr&eacute;hension avant de coller d&eacute;finitivement son traction pad.</p>\r\n\r\n<p>La position est-elle la bonne&nbsp;? La planche est-elle bien pr&eacute;par&eacute;e&nbsp;? On t&rsquo;explique tout&nbsp;!</p>\r\n\r\n<p><strong><em>1/ Pr&eacute;paration de la planche</em></strong></p>\r\n\r\n<p>Elle doit &ecirc;tre NICKEL CHROME, voil&agrave; comment r&eacute;sumer la pr&eacute;paration de ta planche.</p>\r\n\r\n<p>Commence par bien enlever la wax. S&rsquo;il fait beau, quelques minutes au soleil te permettront de laisser ramollir la wax pour l&rsquo;enlever facilement. Sinon, utilise un s&egrave;che-cheveux pour arriver au m&ecirc;me r&eacute;sultat.</p>\r\n\r\n<p>Une fois le gros de la wax enlev&eacute;e, il faut bien d&eacute;graisser la planche. En effet, la wax va laisser un film gras. Pour ce faire, tu peux utiliser de l&rsquo;essence F, cela fonctionnera &agrave; merveille.</p>\r\n\r\n<p>Une fois la planche d&eacute;graiss&eacute;e, tu peux poncer l&eacute;g&egrave;rement (au grain fin) la zone o&ugrave; sera positionn&eacute;e le grip pour une meilleure tenue de la colle.</p>\r\n\r\n<p><strong><em>2/ Positionnement du grip</em></strong></p>\r\n\r\n<p>Positionne le kick ou talon, juste devant le leash plug, &agrave; seulement 1 ou 2cm de ce dernier. L&rsquo;id&eacute;e est d&rsquo;avoir le pied arri&egrave;re au-dessus des d&eacute;rives, pour avoir une bonne man&oelig;uvrabilit&eacute;.</p>\r\n\r\n<p>Utilise ensuite un crayon de papier pour marquer le positionnement du pad avant de d&eacute;coller l&rsquo;adh&eacute;sif.</p>\r\n\r\n<p><img alt=\"Test\" src=\"https://www.nomads-surfing.com/wp-content/uploads/2021/07/comment-bien-poser-son-pad-grip-marque.png\" style=\"height:425px; width:674px\" /></p>\r\n\r\n<p><strong><em>3/ Collage du pad</em></strong></p>\r\n\r\n<p>Une fois le positionnement bien pr&eacute;par&eacute;, tu peux d&eacute;coller l&rsquo;adh&eacute;sif. Utilise un s&egrave;che-cheveux pour activer la colle quelques secondes.</p>\r\n\r\n<p>Une fois la colle chaude, place la pi&egrave;ce du grip sur la planche en pressant bien pour que la colle accroche correctement.</p>\r\n\r\n<p><img alt=\"Test2\" src=\"https://www.nomads-surfing.com/wp-content/uploads/2021/07/comment-bien-poser-son-pad-grip-stick-it.png\" style=\"height:429px; width:643px\" /></p>\r\n\r\n<p>Important&nbsp;: Il faut veiller &agrave; bien presser la p&eacute;riph&eacute;rie du pad ainsi que les bords int&eacute;rieurs des rainures. Il ne faut aucun espace entre la planche et le pad o&ugrave; l&rsquo;eau pourrait s&rsquo;engouffrer. Cela pourrait d&eacute;coller le pad si l&rsquo;eau venait &agrave; se placer entre la planche et le pad.</p>\r\n\r\n<p><img alt=\"Test3\" src=\"https://www.nomads-surfing.com/wp-content/uploads/2021/07/comment-bien-poser-son-pad-grip-press.png\" style=\"height:433px; width:653px\" /></p>\r\n\r\n<p>Laisse maintenant la colle bien se fixer sur la surface en attendant au minimum une heure.</p>\r\n\r\n<p>Bon surf&nbsp;!</p>', '2023-04-13 11:54:52', 1, 'traction-pad-francais-1-piece-traction-pad-3-pieces-ecologique-6461f1303315f747996235.jpg', 591055, '2023-05-15 08:45:36'),
(4, 1, 1, 'Test', 'test', '<p>Le texte de l&#39;article</p>', '2023-05-15 08:15:59', 1, 'banniere-6461ea3f6502d962198629.jpg', 296263, '2023-05-15 08:15:59');

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(2, 4, 'L0uAh33iXZpLT0f0UfYW', 'rH83lWBFI0rZj1pzO58ec0isrqlZxRqSEVm4p4UqXw0=', '2023-02-21 08:52:52', '2023-02-21 09:52:52');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `display_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`, `display_name`) VALUES
(1, 'user1@mail.com', '[\"ROLE_ADMIN\"]', '$2y$13$8PXuBUAMr63ttWwHuyi3q.w31riEB06bp9/oHJdDxG.RNbw9vuNVq', 1, 'Philippe'),
(2, 'user2@mail.com', '[\"ROLE_MODERATEUR\"]', '$2y$13$eT2ENVbQV3lo4OivcN0NK.11he.ctjMDYMWHdrsuZaBwFccGgh3M.', 0, 'Le user 2'),
(3, 'user3@mail.com', '[]', '$2y$13$oQgZYmKlhS4hpa44YnIyL.hPDBU7yI7sBXpJSb4l4Sxpx5KRvjuLW', 0, 'Le user 3'),
(4, 'user4@mail.com', '[]', '$2y$13$UI6Dgz3FjOnq/VJiI40r0OSRx.6XhtvZw8ejoPYZf0oDRH0gHUAZ.', 1, ''),
(6, 'philippe7@example.com', '[\"ROLE_USER\"]', '123456', 0, 'display'),
(7, 'philippe8@example.com', '[\"ROLE_USER\"]', '123456', 0, 'display8');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8D12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_5A8A6C8DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
