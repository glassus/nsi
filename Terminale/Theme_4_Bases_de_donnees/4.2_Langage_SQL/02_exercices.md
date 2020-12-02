# Exercices sur le langage SQL

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
<details><summary> Proposition de correction 🔻 </summary>
<p>

corrigé


</p>
</details>

2. Mme Anne Wizeunid, née en 2000 et demeurant 3 rue des Pignons Verts 12345 Avonelit doit être enregistrée comme patiente. Donner la commande SQLite correspondante.
3. Le patient numéro 100 a changé de genre et est maintenant une femme. Donner la commande SQLite modifiant en conséquence ses données.
4. Par souci d'économie, la direction décide de se passer des médecins spécialisés en épidémiologie. Donner la commande permettant de supprimer leurs fiches.
5. Donner la liste des patient(e)s ayant été examiné(e)s par un(e) psychiatre en avril 2020.
 

## Exercice 2

Questions interactives à réaliser sur le site sqlzoo.net

1. Travail sur SELECT, (base de données Nobel) [ici](https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial)
2. Travail sur SUM et COUNT, (base de données World) [ici](https://sqlzoo.net/wiki/SUM_and_COUNT)
3. Travail sur JOIN, (base de données Euro2012) [ici](https://sqlzoo.net/wiki/The_JOIN_operation)


## Exercice 3
_basé sur le travail de G.Viateau (Bayonne)_

On considère ci-dessous le schéma de la base de données du stock d'un supermarché :

![](data/exo3_schema.png)

1. Quelle requête SQL donne le prix d'achat du produit dont le ```nom_court``` est «Liq_Vaiss_1L» ?
2. Quelle requête donne l'adresse, le code postal et la ville du fournisseur dont le nom est «Avenir_confiseur» ?
3. Quelle requête donne les produits étant en rupture de stock ?
4. Quelle requête donne la liste de toutes les ampoules vendues en magasin ? On pourra faire l'hypothèse que le nom du produit contient le mot «ampoule»?
5. Quelle requête permet d'avoir le prix moyen de ces ampoules ?
6. Quelle requête permet d'identifier le produit le plus cher du magasin ?
7. Quelle requête renvoie les noms des produits dont la date de péremption est dépassée ? _(on pourra utiliser la fonction SQL ```NOW()``` qui renvoie la date actuelle )_

