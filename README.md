# 🍰 Analyse nutritionnelle des desserts - Données CIQUAL 2020

**Auteur :** Tchouenkou David Nathanäel  
**Date :** 15 octobre 2023  
**Langage :** R (avec `readxl`, `base`, `stats`, `graphics`)  
**Fichier source :** Table Ciqual 2020_FR_2020 07 07.xls (ANSES)

---

## 📌 Objectif

Ce projet vise à **analyser la composition nutritionnelle des desserts** à partir de la base de données CIQUAL 2020 (France). L’analyse se concentre sur les teneurs en **énergie, sucres, lipides, fibres et protéines**, et leur distribution selon les **catégories de desserts**.

---

## 🧰 Étapes du projet

### 1. 📥 Importation des données

- Lecture de la table CIQUAL avec `readxl`.
- Création d’un sous-ensemble de variables nutritionnelles pertinentes.

### 2. 🧹 Nettoyage et transformation

- Création d’une fonction `recod()` pour :
  - Remplacer les valeurs manquantes ou mal renseignées (`"-"`, `<x`, lettres).
  - Convertir les chaînes en valeurs numériques.
- Application de cette fonction aux colonnes nutritionnelles.

### 3. 🍮 Filtrage sur les **desserts**

Les groupes alimentaires sélectionnés :
- Fruits
- Produits laitiers frais
- Chocolats
- Confitures
- Gâteaux et pâtisseries
- Glaces, sorbets, desserts glacés

### 4. 📊 Analyses statistiques

#### ➤ Nombre total de desserts :
- **944** observations pour les groupes de desserts.

#### ➤ Desserts avec **énergie > 500 kcal** :
- **147 desserts**.

#### ➤ Desserts avec **énergie inconnue** :
- **272 desserts**.

#### ➤ Moyenne du contenu en **sucres (g/100g)** par groupe :

| Groupe            | Moyenne en sucres |
|-------------------|------------------:|
| Fruits            |       ~8.47 g     |
| Laitages          |       ~11.6 g     |
| Chocolats         |       ~49.2 g     |
| Confitures        |       ~55.8 g     |
| Pâtisseries       |       ~26.1 g     |
| Glaces            |       ~20.2 g     |
| Sorbets           |       ~21.0 g     |
| Desserts glacés   |       ~22.4 g     |

### 5. 📈 Visualisations

#### ✅ Histogramme de la teneur en sucres

- Permet d’observer la distribution de la charge sucrée dans les desserts.

#### ✅ Boxplot des sucres par groupe de dessert

- Comparaison visuelle des médianes et dispersions entre groupes.

#### ✅ Nuages de points :

- **Sucres vs. Énergie**
- **Lipides vs. Énergie**

Ces graphes permettent de visualiser la **corrélation potentielle entre teneur en énergie et les sucres/lipides**, en fonction des groupes alimentaires.

---

## 💡 Résultats clés

- Les groupes **confitures** et **chocolats** sont les plus riches en sucres.
- La majorité des desserts se situent entre **100 et 400 kcal**.
- Une forte concentration de desserts industriels au-dessus de **500 kcal**, notamment les pâtisseries et chocolats.
- Une variabilité importante dans les **valeurs nutritionnelles**, selon les familles de produits.

---

## 🧪 Technologies utilisées

- **R (base, graphics)**
- **readxl** : importation Excel
- **Fonctions statistiques** : `tapply`, `subset`, `summary`
- **Visualisation** : `hist`, `boxplot`, `plot`, `legend`

---

## 📁 Fichiers du projet

- `Analyse_Ciqual.Rmd` : Notebook R Markdown source
- `Table Ciqual 2020_FR_2020 07 07.xls` : Données ANSES
- `README.md` : Présentation du projet

---

## 📚 Références

- Base CIQUAL 2020 : [https://ciqual.anses.fr/](https://ciqual.anses.fr/)
- ANSES – Agence nationale de sécurité sanitaire de l’alimentation

---

## 🙋🏽‍♂️ Contact

Pour toute question ou suggestion :  
📧 tchouenkou.david.nathanael@email.com  
🔗 [LinkedIn](https://www.linkedin.com/in/tonprofil) *(à personnaliser)*

---

