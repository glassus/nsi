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

