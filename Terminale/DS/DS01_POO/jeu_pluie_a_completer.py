import pygame, sys
import time
from pygame.locals import *
from random import randint

clock = pygame.time.Clock()

ecran = (640,480)
FPS = 60

taille_goutte = 10
nb_gouttes = 8

taille_vaisseau = 20

pygame.init()
pygame.display.init()
fenetre = pygame.display.set_mode(ecran)


class Goutte :
    def __init__(self, posx): 
        # Q1 : méthode constructeur
        
  
    def move(self):
        # Q2 : déplacement de l'objet 
        
        
        # Q3 : rebond de l'objet sur le mur du haut et du bas

    
    def draw(self):
        pygame.draw.circle(fenetre,self.color,(self.x,self.y),self.taille)
        
       

class Vaisseau:
    def __init__(self):
        self.x = 40
        self.y = ecran[1] // 2
        self.color = (200,200,200)
        self.taille = taille_vaisseau
        
    def draw(self) :
        pygame.draw.circle(fenetre,self.color,(self.x,self.y),self.taille)
    

# Q4 : compléter le range()
liste_gouttes = []
for k in range( ?? ):
    liste_gouttes.append(Goutte(10+k*ecran[0]//nb_gouttes))


player = Vaisseau()      

chrono = time.time()

while True :
    fenetre.fill([0,0,0])
    
    # Q5 : affichage et mouvement de toutes les gouttes 
    

    # Q6 : affichage du vaisseau du joueur 
    
    
    keys=pygame.key.get_pressed() 

    #Q7 gestion des mouvements au clavier
    if keys[K_LEFT]:
       # mouvement de 5 pixels vers la gauche
    if keys[K_RIGHT]:
       # mouvement de 5 pixels vers la droite      
    if keys[K_UP]:
       # mouvement de 5 pixels vers le haut
    if keys[K_DOWN]:
       # mouvement de 5 pixels vers le bas  
      
    
    # Q8 : test de collision entre le vaisseau et les gouttes.
    # Si une goutte est touchée, son attribut alive doit passer à False.
    #
    #

   
  
    for g in liste_gouttes :  
        if g.alive == False :
            liste_gouttes.remove(g)

    
    if #Q9 : test de fin du jeu
        pygame.display.quit()
        #Q10 : affichage du temps mis par le joueur
        sys.exit()

    
    # routine pour pouvoir fermer «proprement» la fenêtre Pygame
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.display.quit()
            sys.exit()
            
            
    pygame.display.flip()    
    clock.tick(FPS)
