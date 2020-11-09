# Exercices sur le modèle relationnel

## Exercice 1

Deux relations modélisent la flotte de voitures d'un réseau de location de voitures.

**Agences**
| id_agence | ville     | département |
|-----------|-----------|-------------|
| 1         | Paris     | 75          |
| 2         | Lyon      | 69          |
| 3         | Marseille | 13          |
| 4         | Aubagne   | 13          |


**Voitures**
| id_voiture | marque  | modèle | kilométrage | couleur | id_agence |
|------------|---------|--------|-------------|---------|-----------|
| 1          | Renault | Clio   | 12000       | Rouge   | 2         |
| 2          | Peugeot | 205    | 22000       | Noir    | 3         |
| 3          | Toyota  | Yaris  | 33000       | Noir    | 3         |


1. Combien la relation ```Voitures``` comporte-t-elle d'attributs ?
2. Que vaut son cardinal ?
3. Quel est le domaine de l'attribut ```ig_agnece```  dans la relation ```Voitures``` ?
4. Quel est le schéma relationnel de la relation ```Agences ``` ?
5. Quelle est la clé primaire de la relation ```Agences ``` ?
6. Quelle est la clé primaire de la relation ```Voitures ``` ?
7. Quelle est la clé étrangère de la relation ```Voitures ``` ?