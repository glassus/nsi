# Initiation à Pygame
![](data/logopygame.png) 
## 0. Preambule
Pygame est un package de Python facilitant la création de jeux basés une interface graphique. Vous pouvez :
- l'installer sur votre distribution Python, par ```pip3 install pygame```.
- le tester directement via https://repl.it/, en choisissant ```pygame``` dans la liste des langages proposés.

## 1. Préparation de la scène du jeu

```
import pygame, sys
from pygame.locals import *
pygame.init()
fenetre = pygame.display.set_mode((640, 480))
fenetre.fill([10,186,181])
pygame.display.flip()
``` 