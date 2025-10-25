# Cookerz 🍳

Une application mobile iOS moderne dédiée à la cuisine et au partage de recettes, développée en SwiftUI.

## Description

Cookerz est une application culinaire sociale qui permet aux utilisateurs de découvrir, partager et créer des recettes de cuisine. L'application propose une expérience complète avec un système de défis, de récompenses et une communauté active de passionnés de cuisine.

### Contexte de développement

Ce prototype d'application iOS a été développé dans le cadre de la **formation Simplon Apple Foundation Program Extended**. Cette application a été conçue en **4 semaines**, dans le cadre d'un **projet de groupe** réalisé avec Emilie Gueirard, Vivien Huy, Carole Trem et Ihsan Khadem. L'objectif était de créer une application iOS avec SwiftUI sur le thème **"Cuisine"**.

## Fonctionnalités principales

### Accueil

- Flux d'actualités culinaires
- Notifications personnalisées
- Ateliers de cuisine recommandés
- Interface intuitive avec navigation par onglets

### Gestion des recettes

- **Découverte** : Parcours de recettes par catégories (asiatique, italienne, française, végétarienne, vegan, sans lactose)
- **Création** : Publication de nouvelles recettes avec photos
- **Organisation** : Sauvegarde et classification par type
- **Détails complets** : Ingrédients, ustensiles, étapes, temps de préparation, niveau de difficulté

### Aspect social

- Système de likes et de partage
- Profils utilisateurs personnalisables
- Suivi d'autres cuisiniers (followers/following)
- Communauté active

### Système de défis

- Défis culinaires variés
- Système de points et récompenses
- Progression par niveaux (débutant, intermédiaire, expert)
- Badges et accomplissements

### Profil utilisateur

- Profil personnalisable avec avatar
- Historique des recettes créées
- Statistiques personnelles
- Gestion des notifications

## Technologies utilisées

- **Framework** : SwiftUI
- **Langage** : Swift
- **Architecture** : MVVM (Model-View-ViewModel)
- **Interface** : Navigation par TabView
- **Gestion d'état** : StateObject et EnvironmentObject

## Structure de l'application

L'application est organisée en 5 onglets principaux :

1. **Accueil** - Tableau de bord et actualités
2. **Recettes** - Navigation et découverte des recettes
3. **Publier** - Création de nouveau contenu comme des recettes ou des aterliers cuisine en live
4. **Défis** - Challenges et récompenses
5. **Profil** - Gestion du compte utilisateur

## 🗂 Architecture du projet

```text
Cookerz/
├── Models/
│   ├── FoodStuff/          # Modèles liés à la cuisine
│   │   ├── Recipe.swift    # Structure des recettes
│   │   ├── Ingredient.swift # Ingrédients
│   │   ├── Ustensil.swift  # Ustensiles
│   │   └── Enum/           # Énumérations (types, niveaux)
│   ├── Profil/             # Modèles utilisateur
│   │   ├── User.swift      # Profil utilisateur
│   │   ├── Challenge.swift # Système de défis
│   │   └── Reward.swift    # Récompenses
│   └── ViewsStuff/         # Utilitaires pour les vues
├── Views/                  # Interface utilisateur
│   ├── AccueilViews/       # Écrans d'accueil
│   ├── RecipesList/        # Liste des recettes
│   ├── PublicationViews/   # Publication de contenu
│   ├── ChallengesViews/    # Gestion des défis
│   ├── ProfilViews/        # Profil utilisateur
│   └── CommonViews/        # Composants réutilisables
├── ViewModels/             # Logique métier
├── Assets.xcassets/        # Ressources visuelles
│   ├── Colors/             # Palette de couleurs
│   ├── icons/              # Icônes de l'application
│   └── images/             # Images et illustrations
└── Fonts/                  # Polices personnalisées
```

## Design et Assets

L'application dispose d'un système de design cohérent avec :

- **Palette de couleurs** : Tons chauds (jaunes, verts) adaptés au thème culinaire
- **Iconographie** : Icônes personnalisées pour les onglets et fonctionnalités
- **Images** : Ressources organisées par catégories (profils, recettes, récompenses)
- **Typographie** : Polices personnalisées pour une identité visuelle unique

## Installation et développement

### Prérequis

- Xcode 14.0 ou version ultérieure
- iOS 15.0 minimum
- macOS 12.0 ou version ultérieure

### Configuration

1. Clonez le repository

```bash
git clone [URL_DU_REPOSITORY]
```

1. Ouvrez le projet dans Xcode

```bash
open Cookerz.xcodeproj
```

1. Sélectionnez votre simulateur ou appareil iOS
1. Compilez et lancez l'application (⌘+R)

## Modèles de données

### Recipe (Recette)

- **Identifiants** : ID unique, créateur
- **Contenu** : Titre, image, type, portions
- **Préparation** : Durée, niveau de difficulté
- **Composants** : Ingrédients, ustensiles, étapes
- **Social** : Likes, statut favori

### User (Utilisateur)

- **Profil** : Nom, avatar, titre
- **Contenu** : Liste des recettes créées
- **Social** : Followers, following
- **Progression** : Niveaux, défis complétés

### Challenge (Défi)

- **Description** : Nom, icône, description
- **Gameplay** : Points, niveau de difficulté
- **Progression** : Statut d'avancement

## Contribution

Cette application a été développée par une équipe d'étudiants dans le cadre de la formation Simplon Apple Foundation Program Extended. Le projet illustre les compétences acquises en développement iOS avec SwiftUI en seulement 4 semaines de travail collaboratif.

## Licence

Ce projet est développé dans un cadre éducatif (Simplon Apple Foundation Program Extended). Veuillez respecter les droits d'auteur et les conditions d'utilisation.

## Contact

Pour toute question ou suggestion concernant l'application Cookerz, n'hésitez pas à nous contacter.

---

Développé avec ❤️ et Swift pour les passionnés de cuisine
