# Le modèle relationnel
![](data/top.png)

![](data/prog.png)

## 0. De la nécessité d'organiser le stockage de ses données

Lorsqu'une grande quantité de données doit être gérée, il faut savoir distinguer deux choses :
- la structure qui va sous-tendre l'ensemble de ces données, notamment les liens entre elles, les hiérarchies éventuelles,...
- le type de logiciel qui va m'aider à gérer ces données.

Par exemple, si je souhaite stocker toutes les températures relevées dans mon jardin tous les matins à 07h00, je sais que mes données seront des couples ```(date, temperature)``` . Éventuellement ces dates seront regroupées par mois, ou par saison... mais la structure des données sera quand même simple et linéaire.  
Pour gérer ces données, je peux : les écrire à la main dans mon agenda, créer un feuille de tableur avec Excel ou LibreOffice, utiliser une liste dans un IDE Python,...
Chaque méthode aura ses avantages et ses inconvénients.  
- Si le nombre de données à stocker devient très grand, est-ce que ma solution choisie pourra les gérer ?  (on peut par exemple méditer sur le cas du Royaume-Uni dont le comptage des patients positifs au Covid est devenu faux car il a dépassé les limites de leur [feuille Excel](https://www.numerama.com/politique/653217-16-000-anglais-malades-du-covid-ont-ete-oublies-a-cause-dune-feuille-excel-trop-pleine.html))

- Est-ce que d'autres personnes que moi sont susceptibles de consulter ou modifier ces données, éventuellement en même temps que moi ?


- Si une donnée se retrouve à plusieurs endroits dans mes données, devrais-je aller modifier cette donnée partout où elle se trouve ou bien une seule fois ?

L'étude des Bases de Données tente d'apporter des réponses à toutes ces questions.

## 1. Le modèle relationnel

Le programme de Terminale NSI prévoit uniquement l'étude du **modèle relationnel**.

Théorisé en 1970 par le Britannique Edgard J. Codd, le modèle relationnel est à ce jour le modèle de base de données le plus utilisé, même si l'ère actuelle du Big Data tend à mettre en avant d'autres modèles non relationnels (nous en reparlerons).

![codd](data/codd.jpg)

Un modèle relationnel est basé sur des... **relations** :

![](data/rel_livres.png
)



