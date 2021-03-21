
<!---
<p align="center">
<img src="data/banniere.png" width='100%' />

<img src="data/BO.png" width='80%' />
</p>
--->

# Cryptographie

<p align="center">
<img src="data/meme.jpg" width='50%' />
</p>

## 1. Chiffrement symétrique

### 1.1 Activité du masque jetable

On considère la variable suivante :

```python
masque = "CETTEPHRASEESTVRAIMENTTRESTRESLONGUEMAISCESTFAITEXPRES"
```

- Créer une fonction ```chiffre(message_clair, masque)``` qui chiffre ```message ``` en le XORant avec ```masque```.
- Créer une fonction ```dechiffre(message_chiffre, masque)``` qui réalise l'opération inverse.

### 1.2 Principe du chiffrement symétrique

> Dans un chiffrement symétrique, c'est **la même clé** qui va servir au chiffrement et au déchiffrement.


<p align="center">
<img src="data/sym.png"  width="600"/> 
</p>


#### Qu'appelle-t-on une clé ?
La clé est un renseignement permettant de chiffrer ou déchiffrer un message. Cela peut être :
- un nombre (dans un simple décalage des lettres de l'alphabet, comme [le chiffre de César](https://fr.wikipedia.org/wiki/Chiffrement_par_d%C3%A9calage))
- une phrase (dans la méthode du [masque jetable](https://fr.wikipedia.org/wiki/Masque_jetable))
- une image (imaginez un chiffrement où on effectue un XOR par les pixels d'une image, comme dans [cette énigme](https://github.com/glassus/nsi/blob/master/Premiere/DM/DM1/enonce.md))

Un chiffrement est dit symétrique lorsque la connaissance de la clé ayant servi au chiffrement permet de déchiffrer le message. Par exemple, Alice chiffre son message en décalant les lettres de 3 rangs vers la droite dans l'alphabet, Bob saura qu'il doit les décaler de 3 rangs vers la gauche pour retrouver le message initial.

#### Quel est l'avantage d'un chiffrement symétrique ?
Les chiffrements symétriques sont souvent rapides, consommant peu de ressources et donc adaptés au chiffrement de flux important d'informations.

Comme nous le verrons, la sécurisation des données transitant par le protocole ```https``` est basée sur un chiffrement symétrique.

#### Quel est l'inconvénient d'un chiffrement symétrique ?
La clé ! Si Alice et Bob ont besoin d'utiliser un chiffrement pour se parler, comment peuvent-ils échanger leurs clés  puisque leur canal de transmission n'est pas sûr ?

La chiffrement symétrique impose qu'Alice et Bob aient pu se rencontrer physiquement au préalable pour convenir d'une clé secrète, ou bien qu'ils aient réussi à établir une connexion sécurisée pour s'échanger cette clé.

#### Un chiffrement symétrique est-il un chiffrement de mauvaise qualité ?
Pas du tout ! S'il est associé naturellement à des chiffrements simples et faibles (comme le décalage de César), un chiffrement symétrique peut être très robuste... voire inviolable.

C'est le cas du masque jetable. Si le masque avec lequel on effectue le XOR sur le message est aussi long que le message, alors il est **impossible** de retrouver le message initial. Pourquoi ?

Imaginons qu'Alice veuille transmettre le message clair "LUNDI".
Elle le chiffre avec un masque jetable (que connait aussi Bob), et Bob reçoit donc "KHZOK". 
Si Marc a intercepté le message "KHZOK", *même s'il sait que la méthode de chiffrement utilisée est celle du masque jetable* (principe de Kerckhoffs), il n'a pas d'autre choix que de tester tous les masques de 5 lettres possibles.
Ce qui lui donne 26^5 possibilités (plus de 11 millions) pour le masque, et par conséquent (propriété de bijectivité du XOR) 26^5 possibilités pour le message «déchiffré»...

Cela signifie que Marc verra apparaître, dans sa tentative de déchiffrage, les mots "MARDI", "JEUDI", "JOUDI", "STYLO", "FSDJK", "LUNDI, "LUNDA"... 
Il n'a aucune possibilité de savoir où est le bon message original parmi toutes les propositions (on parle de *sécurité sémantique*).


> Principe de Kerckhoffs : la sécurité d'un système de chiffrement ne doit reposer que sur la sécurité de la clé, et non pas sur la connaissance de l'algorithme de chiffrement. Cet algorithme peut même être public (ce qui est pratiquement toujours le cas).


#### Quels sont les chiffrements symétriques modernes ?
L'algorithme de chiffrement symétrique le plus utilisé actuellement est le chiffrement [AES](https://fr.wikipedia.org/wiki/Advanced_Encryption_Standard), pour Advanced Encryption Standard.
- chiffrement par bloc de 128 bits, répartis dans une matrice de 16 octets (matrice carrée de taille 4).
- ces 128 bits sont transformés par des rotations, multiplications, transpositions, [...] de la matrice initiale, en faisant intervenir dans ces transformations une clé de 128, 192 ou 256 bits.
- pour l'AES-256 (avec une clé de 256 bits), l'attaque par force brute nécessiterait 2^256 opérations, soit un nombre à 78 chiffres...
- il n'existe pas d'attaque connue efficace à ce jour. Les seules attaques sont des attaques sur des faiblesses d'implémentation, ou par [canal auxiliaire](https://fr.wikipedia.org/wiki/Attaque_par_canal_auxiliaire).


## 2. Chiffrement asymétrique

Inventé par Whitfield Diffie et Martin Hellman en 1976, le chiffrement asymétrique vient résoudre l'inconvénient essentiel du chiffrement symétrique : le nécessaire partage d'un secret (la clé) avant l'établissement de la communication sécurisée.

### 2.1 Principe du chiffrement asymétrique

Le principe de base est l'existence d'une **clé publique**, appelée à être distribuée largement, et d'une **clé privée**, qui ne quitte jamais son propriétaire. 

<p align="center">
<img src="data/asym.png"  width="600"/> 
</p>


### 2.2 Le rôle interchangeable des clés publiques et privées

L'illustration précédente associe :
- une image de cadenas à la clé publique (car on s'en sert pour chiffrer les messages)
- une image de clé à la clé privée (car on s'en sert pour déchiffrer les messages)

Concrètement, (nous le verrons dans l'applciation par le chiffrement RSA), la clé privée et la clé publique sont **deux nombres** aux rôles identiques. Appelons-les A et B :
- il est impossible de trouver A en fonction de B. Réciproquement, si on connaît A, il est impossible d'en déduire B.
- si on chiffre un message avec A, on peut le déchiffrer avec B. Réciproquement, si on chiffre avec B, on peut déchiffrer le message grâce à A.
- on peut donc chiffrer avec une clé publique et déchiffrer avec la clé privée associée (ce qui est fait dans l'exemple précédent). Mais on peut aussi chiffrer avec la clé privée, et déchiffrer avec la clé publique associée.

A et B ont donc des rôles interchangeables (chacun peut être un cadenas, chacun peut être une clé), et ce n'est qu'en connaissant A **et** B qu'on peut déchiffrer le message.

Nous allons donc maintenant adopter une nouvelle convention infographique :

- Considérons ce message :
<p align="center">
<img src="data/a1.png"  width="80"/> 
</p>

- Si ce message est chiffré avec la clé publique d'Alice, le message sera :
<p align="center">
<img src="data/a2.png"  width="80"/> 
</p>

- Si on déchiffre ce message avec la clé privée d'Alice, il deviendra
<p align="center">
<img src="data/a3.png"  width="80"/> 
</p>
et donc
<p align="center">
<img src="data/a1.png"  width="80"/> 
</p>

puisque l'application de la clé privée sur la clé publique, ou bien de la clé publique sur la clé privée, permet de retrouver le message en clair.

De manière graphique, la connaissance des deux moitiés du disque qui s'assemblent permet de les faire disparaitre, qu'importe qu'on ait commencé par chiffrer avec la clé publique ou avec la clé privée.
<p align="center">
<img src="data/gif_auth.webp"  width="80"/> 
</p>

### 2.3 Communication authentifiée.

Dans la situation du 2.1, Alice (qui a distribué largement sa clé publique) ne peut pas s'assurer que le message vient bien de Bob. Il peut avoir été créé par Marc, qui signe «Bob» et usurpe ainsi son identité. 

Le protocole que nous allons décrire ci-dessous permet :
- d'empêcher qu'un message intercepté soit déchiffré (ce qui était déjà le cas dans le 2.1)
- mais aussi de s'assurer que chaque personne est bien celle qu'elle prétend être : on résout le **problème d'authentification**.

<p align="center">
<img src="data/total_auth.png"  width="600"/> 
</p>

**En résumé :**
- Alice est sûre que seul Bob pourra déchiffrer le message qu'elle envoie.
- Bob est sûr que le message qu'il reçoit vient bien d'Alice.

### 2.3 Un exemple de chiffrement asymétrique : le chiffrement RSA

Lorsqu'en 1976 Diffie et Hellman présentent le concept de chiffrement symétrique (souvent appelé _cryptographie à clés publiques_), ils en proposent uniquement un modèle théorique, n'ayant pas trouvé une réelle implémentation de leur protocole.

Les chercheurs Ron **R**ivest, Adi **S**hamir et Len **A**dleman, se penchent alors sur ce protocole, convaincus qu'il est en effet impossible d'en trouver une implémentation pratique. En 1977, au cours de leurs recherches, ils démontrent en fait l'inverse de ce qu'ils cherchaient : ils créent le premier protocole concret de chiffrement symétrique : le chiffrement **RSA**.

<p align="center">
<img src="data/pic_RSA.jpeg"  width="400"/> 
</p>

Le chiffrement RSA est basé sur *l'arithmétique modulaire*. Faire des calculs *modulo* un entier *n*, c'est ne garder que le reste de la division euclidienne par *n*.

Le fait que 15 soit égal à 1 modulo 7 (car 15=2*7+1) s'écrira 15 ≡ 1 [7].

De même, 10 ≡  3 [7], 25 ≡ 4 [7], 32 ≡ 2 [10], etc.


##### Étape 1
Alice choisit 2 grands nombres premiers *p* et *q*. Dans la réalité ces nombres seront vraiment très grands (plus de 100 chiffres). Dans notre exemple, nous prendrons *p = 3* et *q = 11*.

##### Étape 2
Alice multiplie ces deux nombres *p* et *q* et obtient ainsi un nombre *n*.
>Il est très facile pour Alice de calculer *n* en connaissant *p* et *q*, mais il  extrêmement difficile pour Marc de faire le travail inverse : trouver *p* et *q* en connaissant *n* prend un temps exponentiel avec la taille de *n*.  
C'est sur cette difficulté (appelée difficulté de *factorisation*) que repose la robustesse du système RSA.

##### Étape 3
Alice choisit un nombre *e* qui doit être premier avec *(p-1)(q-1)*.  

