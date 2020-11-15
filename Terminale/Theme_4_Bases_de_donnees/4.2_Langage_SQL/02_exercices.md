# Exercices sur le modèle relationnel

## Exercice 1
*(d'après Prépabac NSI, Terminale, G.CONNAN, V.PETROV, G.ROZSAVOLGYI, L.SIGNAC, éditions HATIER.)*

On veut créer une base de données ```baseHopital.db```  qui contiendra les trois tables suivantes :

|  | Patients |
|-----|----|
| ```Int```  | id |
| ```Text```  | nom |
| ```Text```  | prenom |
| ```Text```  | genre |
| ```Int```  | annee_naissance |


|  | Ordonnances |
|-----|----|
| ```Int```  | code |
| ```Int```  | id_patient |
| ```Int```  | matricule_medecin |
| ```Text```  | date_ord |
| ```Text```  | medicaments |

|  | Medecins |
|-----|----|
| ```Int```  | matricule |
| ```Text```  | nom_prenom |
| ```Text```  | specialite |
| ```Text```  | telephone |


On suppose que les dates sont données sous la forme ```jj-mm-aaaa```.

1. Donner les commandes SQLite permettant de créer ces tables.
2. On a oublié une colonne pour noter les codes postaux des patientes. Donner la commande SQLite permettant cet ajout.
3. Mme Anne Wizeunid, née en 2000 et demeurant 3 rue des Pignons Verts 12345 Avonelit doit être enregistrée comme patiente. Donner la commande SQLite correspondante.
4. Le patient numéro 100 a changé de genre et est maintenant une femme. Donner la commande SQLite modifiant en conséquence ses données.
5. Par souci d'économie, la direction décide de se passer des médecins spécialisés en épidémiologie. Donner la commande permettant de supprimer leurs fiches.
6. Donner la requête permettant d'obtenir la liste des prénoms et des noms des patientes habitant le Finistère dont le prénom commence par une voyelle, triées dans l'ordre croissant des âges.
7. Donner la liste des patient(e)s ayant été examiné(e)s par un(e) psychiatre en avril 2020.
8. Que fait la requête suivante ?
```sql
SELECT m.nom_prenom, COUNT (*)
FROM Medecins AS m
JOIN Ordonnances AS o
ON m.matricule = o.matricule_medecin
WHERE o.date_ord LIKE "%12-2020" AND m.matricule LIKE '1_'
GROUP BY m.matricule;


``` 
