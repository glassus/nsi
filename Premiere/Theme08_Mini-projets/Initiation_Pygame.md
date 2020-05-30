# Initiation à Pygame
![](data/logopygame.png) 
## 0. Preambule
Pygame est un package de Python facilitant la création de jeux basés une interface graphique. Vous pouvez :
- l'installer sur votre distribution Python, par ```pip3 install pygame```.
- le tester directement via https://repl.it/, en choisissant ```pygame``` dans la liste des langages proposés.

## 1. Préparation de la scène du jeu

```python
import pygame, sys
from pygame.locals import *

pygame.init()

fenetre = pygame.display.set_mode((640, 480))

fenetre.fill([10,186,181])

pygame.display.flip()

while True :
  pass
``` 

Ce code devrait vous donner ceci :

<p align="center">
  <img src="data/f1.png"
  />
</p>


**Commentaires**

- Le package ```sys``` permettra de fermer le programme au niveau de l'OS par la commande ```sys.exit()``` 
- La ligne ```from pygame.locals import *``` permettra d'utiliser des variables locales déjà définies par ```pygame```, comme ```MOUSEBUTTONDOWN```, par exemple.
- Durant tout le code, notre scène de travail sera l'objet ```fenetre```, dans lequel nous viendrons coller de nouveaux éléments. 

**Éléments structurants d'un code ```pygame``` :**
- ```pygame.init()```  effectue une initialisation globale de tous les modules ```pygame``` importés. À mettre au début du code.
- ```pygame.display.flip()``` effectue un rafraîchissement total de tous les éléments graphiques de la fenêtre. À mettre donc plutôt vers la fin du code.
- ```while True :``` comme très souvent dans les jeux, la structure essentielle est une boucle infinie dont on ne sortira que par une interruption système (```sys.exit()```) où lors de la bascule d'un booléen. Pour l'instant, cette boucle est vide (```pass``` ).


## 2. Apparition d'un personnage

### 2.1 Téléchargement de l'image
Nous allons travailler avec le sprite ci-dessous, nommé ```perso.png```. Il est issu de https://openclassrooms.com/fr/courses/1399541-interface-graphique-pygame-pour-python/1399813-premieres-fenetres


<p align="center">
<img src="data/perso.png" /> 
</p>

[Téléchargez-le](data/perso.png) pour le mettre dans le même dossier que votre code ```pygame```.

Vous pouvez trouver sur internet un grand nombre de sprites libres de droits, au format ```png``` (donc gérant la transparence), dans de multiples positions (ce qui permet de simuler des mouvements fluides). Ici nous travaillerons avec un sprite unique.

### 2.2 Importation de l'image dans la fenêtre

```python
perso = pygame.image.load("perso.png").convert_alpha()
```
La fonction ```convert_alpha()``` est appelée pour que soit correctement traité le canal de transparence (canal _alpha_) de notre image.

### 2.3 Affichage de l'image

À ce stade, ```perso``` est un objet ```pygame``` de type ```Surface``` .

Afin de facilement pouvoir le déplacer, nous allons stocker la position de cet objet dans une variable ```position_perso```,  qui sera de type ```rect```. 

```python
position_perso = perso.get_rect()
```
Pour afficher cette image, nous allons venir le superposer aux éléments graphiques déjà dessinés (en l'occurence : rien) avec l'instruction ```blit()``` :

```python
fenetre.blit(perso, position_perso)
```

**récapitulatif du code**

```python
import pygame, sys
from pygame.locals import *

pygame.init()

fenetre = pygame.display.set_mode((640, 480))
fenetre.fill([10,186,181])

perso = pygame.image.load("perso.png").convert_alpha()
position_perso = perso.get_rect()

fenetre.blit(perso, position_perso)

pygame.display.flip()

while True :
  pass
```

**Aperçu**

<p align="center">
<img src="data/f2.png" /> 
</p>

