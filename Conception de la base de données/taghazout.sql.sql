-- ============================================================
-- TAGHAZOUT v2 — Script SQL Final Corrigé
-- Base de données : taghazout
-- Version : 2.0 — Cardinalités corrigées
-- ============================================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET NAMES utf8mb4;

-- ============================================================
-- TABLES PRINCIPALES
-- ============================================================

CREATE TABLE `users` (
  `id`             INT(11)      NOT NULL AUTO_INCREMENT,
  `name`           VARCHAR(100) NOT NULL,
  `email`          VARCHAR(100) NOT NULL,
  `password`       VARCHAR(255) NOT NULL,
  `phone`          VARCHAR(20)  DEFAULT NULL,
  `avatar`         VARCHAR(255) DEFAULT 'default.png',
  `role`           ENUM('user','admin') DEFAULT 'user',
  `loyalty_points` INT(11)      DEFAULT 0,
  `created_at`     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================

CREATE TABLE `hotels` (
  `id`          INT(11)       NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(150)  NOT NULL,
  `description` TEXT          DEFAULT NULL,
  `price`       DECIMAL(10,2) DEFAULT NULL,
  `location`    VARCHAR(255)  DEFAULT NULL,
  `image`       VARCHAR(255)  DEFAULT NULL,
  `rating`      DECIMAL(2,1)  DEFAULT 0.0,
  `stars`       INT(11)       DEFAULT 3,
  `type`        VARCHAR(50)   DEFAULT NULL,
  `latitude`    DECIMAL(10,7) DEFAULT NULL,
  `longitude`   DECIMAL(10,7) DEFAULT NULL,
  `created_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================

CREATE TABLE `surf_courses` (
  `id`           INT(11)       NOT NULL AUTO_INCREMENT,
  `title`        VARCHAR(150)  NOT NULL,
  `description`  TEXT          DEFAULT NULL,
  `price`        DECIMAL(10,2) DEFAULT NULL,
  `level`        ENUM('beginner','intermediate','advanced') DEFAULT NULL,
  `duration`     VARCHAR(50)   DEFAULT NULL,
  `max_students` INT(11)       DEFAULT 10,
  `image`        VARCHAR(255)  DEFAULT NULL,
  `created_at`   TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`   TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================

CREATE TABLE `activities` (
  `id`          INT(11)       NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(150)  NOT NULL,
  `description` TEXT          DEFAULT NULL,
  `price`       DECIMAL(10,2) DEFAULT NULL,
  `duration`    VARCHAR(50)   DEFAULT NULL,
  `location`    VARCHAR(255)  DEFAULT NULL,
  `image`       VARCHAR(255)  DEFAULT NULL,
  `rating`      DECIMAL(2,1)  DEFAULT 0.0,
  `created_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================

CREATE TABLE `restaurants` (
  `id`          INT(11)       NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(150)  NOT NULL,
  `description` TEXT          DEFAULT NULL,
  `cuisine`     VARCHAR(100)  DEFAULT NULL,
  `price_range` ENUM('cheap','moderate','expensive') DEFAULT NULL,
  `location`    VARCHAR(255)  DEFAULT NULL,
  `image`       VARCHAR(255)  DEFAULT NULL,
  `rating`      DECIMAL(2,1)  DEFAULT 0.0,
  `latitude`    DECIMAL(10,7) DEFAULT NULL,
  `longitude`   DECIMAL(10,7) DEFAULT NULL,
  `created_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================
-- RESERVATIONS (cardinalités corrigées: 1,N côté user / 1,1 côté booking)
-- ============================================================

CREATE TABLE `bookings` (
  `id`          INT(11)       NOT NULL AUTO_INCREMENT,
  `user_id`     INT(11)       NOT NULL,
  `type`        ENUM('hotel','surf','activity') NOT NULL,
  `reference_id` INT(11)      NOT NULL,
  `check_in`    DATE          DEFAULT NULL,
  `check_out`   DATE          DEFAULT NULL,
  `guests`      INT(11)       DEFAULT 1,
  `total_price` DECIMAL(10,2) DEFAULT NULL,
  `status`      ENUM('pending','accepted','rejected') DEFAULT 'pending',
  `created_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id`  (`user_id`),
  KEY `idx_status`   (`status`),
  KEY `idx_type`     (`type`),
  CONSTRAINT `bookings_ibfk_1`
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================
-- PAIEMENTS (0,1 côté booking — un booking peut ne pas avoir de paiement)
-- ============================================================

CREATE TABLE `payments` (
  `id`             INT(11)       NOT NULL AUTO_INCREMENT,
  `user_id`        INT(11)       NOT NULL,
  `booking_id`     INT(11)       NOT NULL,
  `amount`         DECIMAL(10,2) DEFAULT NULL,
  `method`         ENUM('stripe','paypal','cash') DEFAULT 'cash',
  `status`         ENUM('pending','paid','failed') DEFAULT 'pending',
  `transaction_id` VARCHAR(255)  DEFAULT NULL,
  `created_at`     TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_payments_status` (`status`),
  CONSTRAINT `payments_ibfk_1`
    FOREIGN KEY (`user_id`)    REFERENCES `users`    (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_ibfk_2`
    FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================
-- MESSAGES (1,N côté expéditeur / 1,1 côté message — corrigé)
-- ============================================================

CREATE TABLE `messages` (
  `id`          INT(11)      NOT NULL AUTO_INCREMENT,
  `sender_id`   INT(11)      NOT NULL,
  `receiver_id` INT(11)      NOT NULL,
  `message`     TEXT         NOT NULL,
  `subject`     VARCHAR(255) DEFAULT NULL,
  `is_read`     TINYINT(4)   DEFAULT 0,
  `created_at`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_sender`   (`sender_id`),
  KEY `idx_receiver` (`receiver_id`),
  CONSTRAINT `messages_ibfk_1`
    FOREIGN KEY (`sender_id`)   REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_ibfk_2`
    FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================
-- NOTIFICATIONS (corrigé: booking_id au lieu de id_message)
-- ============================================================

CREATE TABLE `notifications` (
  `id`         INT(11)      NOT NULL AUTO_INCREMENT,
  `user_id`    INT(11)      NOT NULL,
  `booking_id` INT(11)      DEFAULT NULL,
  `title`      VARCHAR(255) NOT NULL,
  `message`    TEXT         DEFAULT NULL,
  `is_read`    TINYINT(4)   DEFAULT 0,
  `created_at` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1`
    FOREIGN KEY (`user_id`)    REFERENCES `users`    (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_notif_booking`
    FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================
-- FAVORIS
-- ============================================================

CREATE TABLE `favorites` (
  `id`           INT(11)   NOT NULL AUTO_INCREMENT,
  `user_id`      INT(11)   NOT NULL,
  `type`         ENUM('hotel','activity','surf','restaurant') NOT NULL,
  `reference_id` INT(11)   NOT NULL,
  `created_at`   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_type`    (`type`),
  CONSTRAINT `favorites_ibfk_1`
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================
-- AVIS
-- ============================================================

CREATE TABLE `reviews` (
  `id`           INT(11)   NOT NULL AUTO_INCREMENT,
  `user_id`      INT(11)   NOT NULL,
  `type`         ENUM('hotel','activity','surf','restaurant') NOT NULL,
  `reference_id` INT(11)   NOT NULL,
  `rating`       INT(11)   DEFAULT NULL CHECK (`rating` BETWEEN 1 AND 5),
  `comment`      TEXT      DEFAULT NULL,
  `created_at`   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_type`    (`type`),
  CONSTRAINT `reviews_ibfk_1`
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================
-- PROGRAMME FIDÉLITÉ
-- ============================================================

CREATE TABLE `loyalty_rewards` (
  `id`          INT(11)       NOT NULL AUTO_INCREMENT,
  `title`       VARCHAR(150)  NOT NULL,
  `description` TEXT          DEFAULT NULL,
  `type`        ENUM('discount','free_night','free_surf','coupon') NOT NULL DEFAULT 'discount',
  `points_cost` INT(11)       NOT NULL,
  `value`       DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `value_type`  ENUM('fixed','percent') DEFAULT 'percent',
  `image`       VARCHAR(255)  DEFAULT NULL,
  `stock`       INT(11)       DEFAULT NULL,
  `is_active`   TINYINT(1)    DEFAULT 1,
  `created_at`  DATETIME      DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================

CREATE TABLE `loyalty_history` (
  `id`         INT(11)      NOT NULL AUTO_INCREMENT,
  `user_id`    INT(11)      NOT NULL,
  `points`     INT(11)      NOT NULL,
  `reason`     VARCHAR(255) DEFAULT NULL,
  `created_at` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  CONSTRAINT `loyalty_history_ibfk_1`
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================

CREATE TABLE `loyalty_redemptions` (
  `id`          INT(11)      NOT NULL AUTO_INCREMENT,
  `user_id`     INT(11)      NOT NULL,
  `reward_id`   INT(11)      NOT NULL,
  `coupon_code` VARCHAR(20)  NOT NULL,
  `points_used` INT(11)      NOT NULL,
  `status`      ENUM('active','used','expired') DEFAULT 'active',
  `used_at`     DATETIME     DEFAULT NULL,
  `expires_at`  DATETIME     DEFAULT NULL,
  `created_at`  DATETIME     DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_code` (`coupon_code`),
  KEY `idx_user_id`  (`user_id`),
  KEY `idx_reward_id` (`reward_id`),
  CONSTRAINT `loyalty_redemptions_ibfk_1`
    FOREIGN KEY (`user_id`)   REFERENCES `users`           (`id`) ON DELETE CASCADE,
  CONSTRAINT `loyalty_redemptions_ibfk_2`
    FOREIGN KEY (`reward_id`) REFERENCES `loyalty_rewards` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================
-- SERVICE IA (nouvelle table — était dans MCD mais absente du SQL)
-- ============================================================

CREATE TABLE `service_ia` (
  `id`           INT(11)      NOT NULL AUTO_INCREMENT,
  `nom_service`  VARCHAR(150) NOT NULL,
  `description`  TEXT         DEFAULT NULL,
  `is_active`    TINYINT(1)   DEFAULT 1,
  `created_at`   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================
-- GALERIE & ÉVÉNEMENTS
-- ============================================================

CREATE TABLE `gallery` (
  `id`         INT(11)      NOT NULL AUTO_INCREMENT,
  `title`      VARCHAR(150) DEFAULT NULL,
  `image`      VARCHAR(255) NOT NULL,
  `category`   ENUM('hotel','activity','surf','restaurant','general') DEFAULT 'general',
  `created_at` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `events` (
  `id`          INT(11)      NOT NULL AUTO_INCREMENT,
  `title`       VARCHAR(150) NOT NULL,
  `description` TEXT         DEFAULT NULL,
  `event_date`  DATE         DEFAULT NULL,
  `location`    VARCHAR(255) DEFAULT NULL,
  `image`       VARCHAR(255) DEFAULT NULL,
  `created_at`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ============================================================
-- DONNÉES INITIALES
-- ============================================================

INSERT INTO `hotels` (`name`, `description`, `price`, `location`, `image`, `rating`, `stars`, `type`) VALUES
('Hyatt Regency Taghazout', 'Expérience de luxe en bord de mer avec vue exceptionnelle sur l\'océan.', 350.00, 'Taghazout', 'hotel_hyatt.jpg', 3.5, 4, 'riad'),
('Auberge Taghazout',       'Séjour confortable dans une ambiance calme, à proximité de la plage.',  180.00, 'Taghazout', 'hotel_auberge.jpg', 3.0, 3, 'auberge'),
('Hilton Taghazout Bay',    'Resort 5 étoiles avec spa, plage privée et 170 chambres modernes.',     650.00, 'Taghazout Bay', 'hotel_hilton.jpg', 4.5, 5, 'villa');

INSERT INTO `surf_courses` (`title`, `description`, `price`, `level`, `duration`, `max_students`) VALUES
('Surf Débutant',      'Apprendre les bases du surf',    300.00, 'beginner',     '3 jours', 8),
('Surf Intermédiaire', 'Améliorer votre technique',      450.00, 'intermediate', '3 jours', 6),
('Surf Avancé',        'Maîtriser les vagues',           100.00, 'advanced',     '3 jours', 4);

INSERT INTO `activities` (`name`, `description`, `price`, `duration`, `location`, `rating`) VALUES
('Yoga sur la plage', 'Séance de yoga au lever du soleil', 100.00, '1h', 'Anchor Point', 4.5),
('Randonnée',         'Randonnée dans les collines d\'Agadir', 150.00, '4h', 'Taghazout', 4.3),
('Sandboarding',      'Glisser sur les dunes de sable',   200.00, '1h', 'Taghazout', 4.2);

INSERT INTO `restaurants` (`name`, `description`, `cuisine`, `price_range`, `location`, `rating`) VALUES
('La Sqala',           'Restaurant vue sur mer',       'Marocaine',      'moderate',  'Taghazout',     4.6),
('Windy Bay Restaurant','Snacks et jus frais',          'Internationale', 'cheap',     'Taghazout Beach',4.3),
('Ocean Breeze',        'Poissons frais et grillades',  'Fruits de mer',  'expensive', 'Taghazout Bay', 4.8);

INSERT INTO `loyalty_rewards` (`title`, `description`, `type`, `points_cost`, `value`, `value_type`) VALUES
('Réduction 10%',    'Obtenez 10% de réduction sur votre prochaine réservation.', 'discount',   100, 10.00,  'percent'),
('Réduction 20%',    'Obtenez 20% de réduction sur votre prochaine réservation.', 'discount',   180, 20.00,  'percent'),
('Réduction 50 MAD', '50 MAD de réduction sur votre prochaine réservation.',      'discount',    80, 50.00,  'fixed'),
('Réduction 100 MAD','100 MAD de réduction sur votre prochaine réservation.',     'discount',   150, 100.00, 'fixed'),
('1 Nuit Gratuite',  'Une nuit offerte dans un hôtel partenaire (500 MAD max).',  'free_night', 500, 500.00, 'fixed'),
('Cours Surf Gratuit','Un cours de surf offert pour 1 personne.',                 'free_surf',  300, 300.00, 'fixed');

INSERT INTO `service_ia` (`nom_service`, `description`) VALUES
('Chatbot Recommandation', 'Suggère hôtels et activités selon les préférences utilisateur'),
('Analyse Avis',           'Analyse les commentaires et extrait les sentiments'),
('Détection Anomalies',    'Détecte les réservations suspectes ou aberrantes');

COMMIT;
-- ============================================================
-- FIN DU SCRIPT ✅
-- ============================================================
