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
