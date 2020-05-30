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
- la ligne ```from pygame.locals import *``` permettra d'utiliser des variables locales déjà définies par ```pygame```, comme ```MOUSEBUTTONDOWN```, par exemple.

**Éléments structurants d'un code ```pygame``` :**
- ```pygame.init()```  effectue une initialisation globale de tous les modules ```pygame``` importés. À mettre au début du code.
- ```pygame.display.flip()``` effectue un rafraîchissement total de tous les éléments graphiques de la fenêtre. À mettre donc plutôt vers la fin du code.
- ```while True :``` comme très souvent dans les jeux, la structure essentielle est une boucle infinie dont on ne sortira que par une interruption système (```sys.exit()```) où lors de la bascule d'un booléen. Pour l'instant, cette boucle est vide (```pass``` ).


## 2. Apparition d'un personnage

Nous allons travailler avec le sprite ci-dessous, nommé ```perso.png```. Il est issu de https://openclassrooms.com/fr/courses/1399541-interface-graphique-pygame-pour-python/1399813-premieres-fenetres


<p align="center">
<img src="data/perso.png" /> 
</p>

Téléchargez-le pour le mettre dans le même dossier que votre code ```pygame```.

