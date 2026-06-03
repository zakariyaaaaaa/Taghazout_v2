<img width="1536" height="1024" alt="MCD" src="https://github.com/user-attachments/assets/537d04f1-78b2-4aea-8d30-3d48aae9c64e" /># 🏄 Taghazout v2 — Plateforme de Réservation Touristique

![PHP](https://img.shields.io/badge/PHP-8.2-777BB4?logo=php&logoColor=white)
![MariaDB](https://img.shields.io/badge/MariaDB-10.4-003545?logo=mariadb&logoColor=white)
![Stripe](https://img.shields.io/badge/Stripe-Payment-635BFF?logo=stripe&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Active-success)

Taghazout v2 est une plateforme web complète de réservation touristique dédiée à la ville de **Taghazout**, Maroc. Elle permet aux visiteurs de réserver des hôtels, activités, cours de surf et restaurants, avec un système de paiement intégré via Stripe.

---

## ✨ Fonctionnalités

### 👤 Côté Utilisateur
- Inscription / Connexion sécurisée
- Recherche et réservation d'hôtels, activités, cours de surf et restaurants
- Paiement en ligne via **Stripe**
- Historique des réservations
- Système de points de fidélité
- Avis et commentaires
- Messagerie interne
- Notifications en temps réel
- Mode sombre / clair

### 🛠️ Côté Admin
- Dashboard avec statistiques en temps réel
- Gestion des utilisateurs (CRUD)
- Gestion des réservations et paiements
- Gestion du contenu (hôtels, activités, surf, restaurants)
- Modération des avis
- Messagerie admin

---

## 🛠️ Stack Technique

| Technologie | Usage |
|-------------|-------|
| PHP 8.2 | Backend |
| MariaDB 10.4 | Base de données |
| Stripe API | Paiement en ligne |
| Chart.js | Graphiques dashboard |
| CSS3 / DM Sans / Syne | Design UI |

---

## 📁 Structure du Projet

```
Taghazout_v2/
├── admin/
│   ├── dashboard.php
│   ├── users/
│   ├── bookings/
│   ├── payments/
│   ├── hotels/
│   ├── activities/
│   ├── surf-courses/
│   ├── restaurants/
│   ├── reviews/
│   └── messages/
├── auth/
│   ├── login.php
│   └── register.php
├── booking/
│   └── my-bookings.php
├── payment/
│   ├── checkout.php
│   ├── payment-success.php
│   └── payment-failed.php
├── includes/
│   ├── config.php
│   ├── navbar.php
│   └── footer.php
├── assets/
│   ├── css/
│   │   ├── style.css
│   │   └── admin.css
│   └── js/
│       └── main.js
├── database/
│   ├── taghazout.sql
│   └── taghazout_fixes.sql
├── diagrams/
│   ├── MCD.png
│   └── MLD.png
├── screenshots/
│   ├── home.png
│   ├── dashboard.png
│   └── booking.png
└── index.php
```

---

## 📸 Screenshots

### Page d'accueil
![Home](screenshots/home.png)

### Dashboard Admin
![Dashboard](screenshots/dashboard.png)

### Réservation
![Booking](screenshots/booking.png)

---

## 🗄️ Base de données

**Système :** MariaDB 10.4 / MySQL  
**Nom de la BDD :** `taghazout`

### Tables principales

| Table | Description |
|-------|-------------|
| `users` | Utilisateurs (clients + admin) |
| `hotels` | Hôtels disponibles |
| `surf_courses` | Cours de surf |
| `activities` | Activités (yoga, randonnée, sandboarding...) |
| `restaurants` | Restaurants |
| `bookings` | Réservations (hôtels, surf, activités) |
| `payments` | Paiements (Stripe, PayPal, Cash) |
| `reviews` | Avis et notes des utilisateurs |
| `favorites` | Favoris des utilisateurs |
| `messages` | Messagerie entre utilisateurs |
| `notifications` | Notifications en temps réel |
| `loyalty_rewards` | Récompenses du programme fidélité |
| `loyalty_history` | Historique des points gagnés |
| `loyalty_redemptions` | Échanges de points contre des récompenses |
| `events` | Événements locaux |
| `gallery` | Galerie photos |
| `service_ia` | Services d'intelligence artificielle |

### Diagrammes

#### MCD — Modèle Conceptuel de Données
![MCD](diagrams/MCD.png)

#### MLD — Modèle Logique de Données
![MLD](diagrams/MLD.png)

---

## 🚀 Installation

### Prérequis
- PHP 8.2+
- MariaDB 10.4+
- Composer
- Compte Stripe (pour les paiements)

### Étapes

**1. Cloner le projet**
```bash
git clone https://github.com/zakariyaaaaaa/Taghazout_v2.git
cd Taghazout_v2
```

**2. Installer les dépendances**
```bash
composer install
```

**3. Configurer la base de données**
```bash
mysql -u root -p taghazout < database/taghazout.sql
```

**4. Configurer `includes/config.php`**
```php
$pdo = new PDO(
    "mysql:host=localhost;dbname=taghazout;charset=utf8",
    "root",      // votre username
    ""           // votre password
);
```

**5. Configurer les clés Stripe**

Dans `payment/checkout.php` et `payment/payment-success.php` :
```php
\Stripe\Stripe::setApiKey('sk_test_VOTRE_CLE_SECRETE');
```

**6. Lancer le serveur**
```bash
php -S localhost:3000
```

Ouvrir [http://localhost:3000](http://localhost:3000)

---

## 💳 Paiement Stripe

Le projet utilise **Stripe Checkout** en mode test.

Pour tester un paiement :
- Numéro de carte : `4242 4242 4242 4242`
- Date : n'importe quelle date future
- CVC : n'importe quel code à 3 chiffres

---

## 👤 Compte Admin par défaut

| Champ | Valeur |
|-------|--------|
| Email | test@test.com |
| Mot de passe | 12345678 |

---

## 📄 Licence

MIT License — libre d'utilisation et de modification.

---

## 👨‍💻 Auteur

**Zakariya** — [GitHub](https://github.com/zakariyaaaaaa)

> Projet réalisé dans le cadre d'un apprentissage fullstack PHP/MariaDB avec intégration de paiement Stripe.
