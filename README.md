# 🏄 Taghazout v2 — Plateforme de Réservation Touristique

![PHP](https://img.shields.io/badge/PHP-8.2-777BB4?logo=php\&logoColor=white)
![MariaDB](https://img.shields.io/badge/MariaDB-10.4-003545?logo=mariadb\&logoColor=white)
![Stripe](https://img.shields.io/badge/Stripe-Payment-635BFF?logo=stripe\&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Active-success)

Taghazout v2 est une plateforme web complète de réservation touristique dédiée à la ville de **Taghazout**, Maroc. Elle permet aux visiteurs de réserver des hôtels, activités, cours de surf et restaurants à travers une interface moderne et intuitive, avec un système de paiement sécurisé intégré via Stripe.

---

## 🌍 Présentation du Projet

Taghazout v2 a été développé dans le but de digitaliser les services touristiques de la région de Taghazout et de faciliter l'accès aux différentes offres disponibles.

La plateforme centralise plusieurs services :

* Réservation d'hôtels
* Réservation d'activités touristiques
* Réservation de cours de surf
* Réservation de restaurants
* Gestion des paiements en ligne
* Programme de fidélité
* Système de messagerie
* Gestion administrative complète

L'objectif principal est d'offrir une expérience utilisateur simple, rapide et efficace.

---

## ✨ Fonctionnalités

### 👤 Côté Utilisateur

* Inscription / Connexion sécurisée
* Gestion du profil utilisateur
* Recherche avancée
* Réservation d'hôtels
* Réservation d'activités
* Réservation de cours de surf
* Réservation de restaurants
* Paiement sécurisé via Stripe
* Historique des réservations
* Gestion des favoris
* Système de fidélité
* Avis et commentaires
* Notifications en temps réel
* Messagerie interne
* Mode sombre / clair

### 🛠️ Côté Administrateur

* Dashboard interactif
* Gestion des utilisateurs (CRUD)
* Gestion des réservations
* Gestion des paiements
* Gestion des hôtels
* Gestion des activités
* Gestion des cours de surf
* Gestion des restaurants
* Gestion des avis
* Gestion des événements
* Gestion des notifications
* Messagerie administrateur
* Statistiques en temps réel

---

## 🎨 Design UI/UX

Le design de Taghazout v2 a été conçu pour offrir une expérience utilisateur moderne, intuitive et agréable.

### 🎯 Objectifs du Design

* Simplifier la navigation.
* Réduire le nombre de clics nécessaires.
* Mettre en valeur les informations importantes.
* Garantir une expérience utilisateur fluide.
* Offrir une interface moderne et professionnelle.

### 🎨 Palette de couleurs

Le choix des couleurs a été inspiré par l'identité visuelle de la ville de Taghazout.

| Couleur                 | Signification                         |
| ----------------------- | ------------------------------------- |
| 🔵 Bleu                 | Océan Atlantique, confiance, sérénité |
| ⚪ Blanc                 | Clarté, simplicité, lisibilité        |
| 🌊 Couleurs secondaires | Voyage, tourisme et surf              |

Cette combinaison permet d'obtenir une interface harmonieuse et professionnelle.

### 🏄 Logo

Le logo du projet représente :

* Le tourisme.
* Le voyage.
* Le surf.
* L'identité de Taghazout.
* La modernité de la plateforme.

Son design minimaliste améliore sa visibilité et sa reconnaissance.

### ☀️ Light Mode

* Interface lumineuse.
* Excellente lisibilité.
* Aspect moderne et professionnel.

### 🌙 Dark Mode

* Réduction de la fatigue visuelle.
* Confort accru en environnement sombre.
* Expérience utilisateur améliorée.

### 📱 Responsive Design

Le site est entièrement responsive :

* 💻 Ordinateurs
* 📱 Smartphones
* 📟 Tablettes

L'interface s'adapte automatiquement à tous les écrans.

### 🎨 Maquette Figma

👉 https://www.figma.com/design/THQNT1UjzYcQwSPuRWNjWV/Untitled?node-id=0-1&m=dev&t=EnvAdKtgUx68xXrL-1

---

## 🛠️ Stack Technique

| Technologie  | Usage                     |
| ------------ | ------------------------- |
| PHP 8.2      | Backend                   |
| MariaDB 10.4 | Base de données           |
| Stripe API   | Paiement en ligne         |
| Chart.js     | Dashboard et statistiques |
| CSS3         | Interface utilisateur     |
| JavaScript   | Interactivité             |
| DM Sans      | Typographie               |
| Syne         | Titres                    |

---

## 📁 Structure du Projet

```text
Taghazout_v2/
├── admin/
├── auth/
├── booking/
├── payment/
├── includes/
├── assets/
├── database/
├── diagrams/
├── screenshots/
└── index.php
```

---

## 📸 Screenshots

### 🏠 Page d'accueil

![Home](screenshots/home.png)

### 📊 Dashboard Administrateur

![Dashboard](screenshots/dashboard.png)

### 📅 Réservation

![Booking](screenshots/booking.png)

---

## 🗄️ Base de Données

### Système

* MariaDB 10.4
* MySQL Compatible

### Nom de la Base

```sql
taghazout
```

### Tables Principales

| Table               | Description                 |
| ------------------- | --------------------------- |
| users               | Gestion des utilisateurs    |
| hotels              | Hôtels disponibles          |
| surf_courses        | Cours de surf               |
| activities          | Activités touristiques      |
| restaurants         | Restaurants                 |
| bookings            | Réservations                |
| payments            | Paiements                   |
| reviews             | Avis utilisateurs           |
| favorites           | Favoris                     |
| messages            | Messagerie                  |
| notifications       | Notifications               |
| loyalty_rewards     | Récompenses                 |
| loyalty_history     | Historique fidélité         |
| loyalty_redemptions | Utilisation des récompenses |
| events              | Événements                  |
| gallery             | Galerie                     |
| service_ia          | Services IA                 |

---

## 📊 Diagrammes

### MCD — Modèle Conceptuel de Données

![MCD](diagrams/MCD.png)

### MLD — Modèle Logique de Données

![MLD](diagrams/MLD.png)

---

## 🚀 Installation

### Prérequis

* PHP 8.2+
* MariaDB 10.4+
* Composer
* Compte Stripe

### 1️⃣ Cloner le projet

```bash
git clone https://github.com/zakariyaaaaaa/Taghazout_v2.git
cd Taghazout_v2
```

### 2️⃣ Installer les dépendances

```bash
composer install
```

### 3️⃣ Importer la base de données

```bash
mysql -u root -p taghazout < database/taghazout.sql
```

### 4️⃣ Configurer la connexion

```php
$pdo = new PDO(
    "mysql:host=localhost;dbname=taghazout;charset=utf8",
    "root",
    ""
);
```

### 5️⃣ Configurer Stripe

```php
\Stripe\Stripe::setApiKey('sk_test_VOTRE_CLE');
```

### 6️⃣ Lancer le projet

```bash
php -S localhost:3000
```

Puis ouvrir :

```text
http://localhost:3000
```

---

## 💳 Paiement Stripe

Le projet utilise Stripe Checkout.

Carte de test :

```text
4242 4242 4242 4242
```

Date : Future

CVC : 123

---

## 👤 Compte Administrateur

| Champ        | Valeur                                            |
| ------------ | ------------------------------------------------- |
| Email        | [admin@taghazout.com](mailto:admin@taghazout.com) |
| Mot de passe | 12345678                                          |

---

## 📈 Perspectives d'Évolution

Les prochaines versions pourront intégrer :

* 📱 Application mobile Android/iOS
* 🤖 Intelligence artificielle avancée
* 📍 Géolocalisation en temps réel
* 🌍 Support multilingue
* 🎁 Programme fidélité avancé
* 📊 Analyses statistiques avancées
* 🗺️ Cartographie interactive
* 💬 Chat en direct

---

## 📄 Licence

MIT License

Libre d'utilisation, de modification et de distribution.

---

## 👨‍💻 Auteur

**Zakariya**

GitHub :
https://github.com/zakariyaaaaaa

---

> Projet réalisé dans le cadre d'un projet Full Stack PHP / MariaDB visant à moderniser la réservation touristique à Taghazout grâce à une plateforme web complète, responsive et sécurisée.
