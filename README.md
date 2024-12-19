# hello-dbms
# Documentation : Données et Concepts Associés

## A. Qu’est-ce qu’une donnée ? Sous quelle forme peut-elle se présenter ?

### Définition  
Une donnée est une information élémentaire, brute, utilisée comme base pour des calculs, des analyses ou des prises de décision.

### Formes principales :  
1. **Données structurées** :  
   - Organisation rigoureuse en tableaux ou bases relationnelles (ex : noms, âges, adresses).  

2. **Données semi-structurées** :  
   - Format flexible mais structuré, comme les fichiers JSON ou XML.  

3. **Données non structurées** :  
   - Sans organisation prédéfinie, comme les images, vidéos ou documents texte.  

4. **Données temporelles (temps réel)** :  
   - Générées en continu, adaptées aux systèmes réactifs (ex : capteurs IoT, logs).

---

## B. Critères de mesure de qualité des données

1. **Exactitude (Accuracy)** : Les données sont-elles fidèles à la réalité ?  
2. **Complétude (Completeness)** : Contiennent-elles toutes les informations nécessaires ?  
3. **Cohérence (Consistency)** : Sont-elles alignées et sans contradictions entre différentes sources ?  
4. **Actualité (Timeliness)** : Sont-elles disponibles au moment opportun ?  
5. **Accessibilité (Accessibility)** : Peuvent-elles être consultées facilement et en toute sécurité ?  
6. **Fiabilité (Reliability)** : Sont-elles issues de sources vérifiées et fiables ?

---

## C. Comparaison : Data Lake, Data Warehouse et Lake House

| **Critères**       | **Data Lake**         | **Data Warehouse**    | **Lake House**         |
|--------------------|-----------------------|-----------------------|------------------------|
| **Type de données** | Brutes (non traitées) | Structurées            | Mixtes                |
| **Performance**     | Modérée              | Élevée                | Équilibrée            |
| **Coût**            | Faible               | Élevé                 | Moyen                 |
| **Outils d’analyse**| Big Data             | SQL                   | SQL + Big Data        |

- **Data Lake** : Stockage brut, flexible pour les analyses massives (ex : logs).  
- **Data Warehouse** : Stockage structuré pour des analyses rapides (ex : KPI d’entreprise).  
- **Lake House** : Combine flexibilité et performances des deux (ex : Delta Lake).  

---

## D. Systèmes de gestion de bases de données (SGBD)

### Définition  
Un SGBD est un logiciel qui permet de gérer, manipuler et interagir avec des bases de données.

### Types et exemples :  
1. **Relationnels (SQL)** : MySQL, PostgreSQL, Oracle Database.  
   - Organisation en tables avec relations bien définies.  
   - Exemple : Gestion des clients dans un CRM.  

2. **Non relationnels (NoSQL)** : MongoDB, Cassandra, DynamoDB.  
   - Adaptés aux données volumineuses et non structurées.  
   - Exemple : Catalogues de produits dans une plateforme d’e-commerce.

---

## E. Bases de données relationnelles et non relationnelles

### Base relationnelle :  
- Données organisées en tables.  
- Exemple : MySQL, PostgreSQL.  
- Cas d’utilisation : Gestion des stocks ou utilisateurs.

### Base non relationnelle :  
- Stockage plus flexible (documents, colonnes, graphes).  
- Exemple : MongoDB, CouchDB.  
- Cas d’utilisation : Applications massives ou non transactionnelles.

### Différence principale :  
- **Relationnelle** : Schéma strict et structuré.  
- **Non relationnelle** : Schéma flexible, adapté aux Big Data.

---

## F. Clé primaire et clé étrangère

- **Clé primaire** : Identifiant unique pour chaque ligne d’une table.  
  - Exemple : `user_id` dans une table `Users`.  
- **Clé étrangère** : Référence à une clé primaire d’une autre table.  
  - Exemple : `user_id` dans une table `Orders`, lié à `Users`.

---

## G. Propriétés ACID

1. **Atomicité (Atomicity)** : Une transaction est réalisée ou annulée entièrement.  
2. **Cohérence (Consistency)** : Les données respectent les règles définies.  
3. **Isolation (Isolation)** : Les transactions concurrentes ne se chevauchent pas.  
4. **Durabilité (Durability)** : Les données sont sauvegardées même en cas de panne.

---

## H. Méthodes Merise et UML

### Merise :  
- Méthode pour concevoir des systèmes d’information et bases relationnelles.  
- Utilisation : Diagrammes entité-association (ex : conception d’une base de données).

### UML :  
- Langage graphique pour modéliser des systèmes orientés objets.  
- Utilisation : Diagrammes de classes pour décrire des objets et leurs interactions.

---

## I. Langage SQL

### Définition  
SQL (Structured Query Language) est le langage standard pour interagir avec des bases relationnelles.

### Commandes principales :  
- **Création de table** : `CREATE TABLE`  
- **Insertion de données** : `INSERT INTO`  
- **Sélection** : `SELECT`  
- **Mise à jour** : `UPDATE`  
- **Suppression** : `DELETE`

### Types de jointures :  
1. **INNER JOIN** : Retourne les correspondances entre deux tables.  
2. **LEFT JOIN** : Retourne toutes les données de la table gauche, même sans correspondances.  
3. **RIGHT JOIN** : Retourne toutes les données de la table droite, même sans correspondances.  
4. **FULL OUTER JOIN** : Combine toutes les données des deux tables.
