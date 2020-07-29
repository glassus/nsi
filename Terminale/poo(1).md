Version élève de ce notebook à retrouver sur https://colab.research.google.com/github/glassus/nsi/blob/master/Terminale/poo.ipynb

# Programmation Orientée Objet
_abrégée par POO en français, OOP en anglais (ne pas confondre)_

## 0. Introduction
La POO est un **paradigme** de programmation, au même titre que la programmation impérative (que nous pratiquons déjà) ou la programmation fonctionnelle (qui sera étudiée cette année en Terminale), ou encore d'autres paradigmes (la liste est longue).  
Un paradigme de programmation pourrait se définir comme une _philosophie_ dans la manière de programmer : c'est un parti-pris revendiqué dans la manière d'aborder le problème à résoudre. Une fois cette décision prise, des outils spécifiques au paradigme choisi sont utilisés. 

**Exemple** 

Imaginons 3 menuisiers qui ont pour mission de fabriquer chacun un meuble. 
- Le premier pourra décider d'utiliser du collé-pointé : il assemblera les morceaux de bois en les collant puis utilisera des pointes. Ses outils seront le marteau et le pistolet à colle.
- Le deuxième pourra décider de visser les morceaux de bois entre eux : son outil principal sera une visseuse.
- Le troisième pourra décider de faire de l'assemblage par [tenons et mortaises](https://www.fraise-defonceuse.fr/tenon-mortaise-defonceuse/) : son outil principal sera une défonceuse.

Pour la réalisation de sa mission, chaque menuisier utilise un paradigme différent. 
Qui utilise la meilleure méthode ? Cette question n'a pas vraiment de réponse : certaines méthodes sont plus rapides que d'autres, d'autres plus robustes, d'autres plus esthétiques...  
Et pourquoi ne pas mélanger les paradigmes ? Rien n'interdit d'utiliser des pointes ET des vis dans la fabrication d'un meuble. 

La Programmation Orientée Objet sera (surtout à notre niveau) mélangée avec de la programmation impérative, de la programmation fonctionnelle... d'ailleurs vous avez déjà manipulé des objets sans le savoir :

## 1. Des objets déjà autour de nous


```python
m = [4,5,2]
```


```python
type(m)
```




    list



```m``` est une liste, ou plus précisément un **objet** de type ```list```. Et en tant qu'objet de type ```list```, il est possible de lui appliquer certaines fonctions prédéfinies (qu'on appelera **méthodes**) :


```python
m.reverse()
```

La syntaxe utilisée (le . après le nom de l'objet) est spécifique à la POO. Chaque fois que vous voyez cela, c'est que vous êtes en train de manipuler des objets.  
Mais qu'a donc fait cette méthode ```reverse()``` ?   


```python
m
```




    [2, 5, 4]



Nous ne sommes pas surpris par ce résultat car la personne qui a programmé la méthode ```reverse()``` lui a donné un nom explicite.  
Comment a-t-elle programmé cette inversion des valeurs de la liste ? Nous n'en savons rien et cela ne nous intéresse pas. Nous sommes juste utilisateurs de cette méthode. 
L'objet ```list``` nous a été livré avec sa méthode ```reverse()``` (et bien d'autres choses) et nous n'avons pas à démonter la boîte pour en observer les engrenages : on parle de principe d'**encapsulation**.

## 2. Créer ~~son propre objet~~ sa propre classe
### 2.1 Vocabulaire : classe,  objet, instance de classe
Jusqu'ici nous avons employé uniquement le mot «objet». Il convient maintenant d'être plus précis.  
On désignera par **classe** la structure de données définissant une catégorie générique d'objets. Dans le monde animal, _chat_ est une classe (nommée en réalité _félidé_ ).  
Chaque élement de la classe _chat_ en possède les caractéristiques : 4 pattes, une longue queue, des moustaches (on appelera ces caractéristiques des **attributs**) et des fonctionnalités, comme la **méthode** ```miauler()```.  
Lorsqu'on désigne un chat en particulier, on désigne alors un **objet** (bien réel) qui est une **instance** de la **classe** (abstraite) _chat_. 

Par exemple, 
l'**objet** <a href="https://fr.wikipedia.org/wiki/Larry_(chat)">Larry</a> est une **instance** de la **classe** _chat_ . 





### 2.2 Création d'une classe

#### 2.2.1 (mauvaise) manière minimale
Créons une classe «voiture». Il suffit d'écrire :


```python
class Voiture :
    pass   #pass, car pour l'instant il n'y a rien dans la déclaration de la classe (et c'est mal)
```

La classe ```Voiture``` est créée.  
Notez que par convention, le nom d'une classe commence toujours par une majuscule.  
Pour créer une instance de cette classe, il suffit d'écrire :


```python
titine = Voiture()
```


```python
type(titine)
```




    __main__.Voiture



On peut alors donner des attributs à cette instance :


```python
titine.annee = 2018
titine.couleur = "verte"
titine.vitesse_max = 162
```

Mais arrêtons-là cette mauvaise méthode. Si on désire créer une classe «voiture», c'est pour créer un concept générique de voiture et d'en spécifier des caractéristiques communes  : l'année, la couleur, la vitesse maximale... 

L'idée est donc qu'à la création (on dira plutôt à la **construction**) de chaque objet voiture, on va lui spécifier directement ses attributs :

### 2.2.2 (bonne) manière : la méthode constructeur 

La **méthode constructeur**, toujours appelée ```__init__()```, est une méthode (une «def») qui sera automatiquement appelée à la création de l'objet. Elle va donc le doter de tous les attributs de sa classe.


```python
class Voiture :
    def __init__(self, annee, coul, vmax) :
        self.annee = annee
        self.couleur = coul
        self.vitesse_max = vmax
        self.age = 2020 - self.annee
```

- le mot-clé ```self```, omniprésent en POO (d'autres langages utilisent ```this```), fait référence à l'objet lui-même, qui est en train d'être construit.
- pour construire l'objet, 3 paramètres seront nécessaires : ```annee```, ```coul``` et ```vmax```. Ils donneront respectivement leur valeur aux attributs ```annee```, ```couleur``` et ```vitesse_max```.
- dans cet exemple, les noms ```coul``` et ```vmax``` ont été utilisés pour abréger ```couleur``` et ```vitesse_max```, mais il est recommandé de garder les mêmes noms, même si ce n'est pas du tout obligatoire.

Construisons donc notre première voiture !


```python
mon_bolide = Voiture(2012, "rouge", 190)
```


```python
type(mon_bolide)
```




    __main__.Voiture



```mon_bolide``` possède 4 attributs : 
- ```annee```, ```couleur``` et ```vitesse_max``` ont été donnés par l'utilisateur lors de la création.
- ```age``` s'est créé «tout seul» par l'instruction ```self.age = 2020 - self.annee```.


```python
print(mon_bolide.annee)
print(mon_bolide.couleur)
print(mon_bolide.vitesse_max)
print(mon_bolide.age)
```

    2012
    rouge
    190
    8


Bien sûr, on peut créer une autre voiture en suivant le même principe :


```python
batmobile = Voiture(2036, "noire", 325)
```


```python
batmobile.couleur
```




    'noire'



### 2.2.3 Exercice 
Créer une classe ```Point``` permettant de créer un objet ```A``` d'abscisse ```A.x``` et d'ordonnée ```A.y```


```python
# correction

class Point :
    def __init__(self,x,y):
        self.x = x
        self.y = y
        
A = Point(3,8)
print(A.x, A.y)
```

    3 8


### 2.2.4 Créer une méthode pour notre objet


```python
class Voiture :
    def __init__(self, annee, coul, vmax) :
        self.annee = annee
        self.couleur = coul
        self.vitesse_max = vmax
        self.age = 2020 - self.annee
    
    def petite_annonce(self) :
        print("À vendre voiture", self.couleur, "de", self.annee, ", vitesse maximale", self.vitesse_max, "km/h.")
```


```python
batmobile = Voiture(2036, "noire", 325)
```


```python
batmobile.petite_annonce()
```

    À vendre voiture noire de 2036 , vitesse maximale 325 km/h.


### 2.2.5 Exercice
Reprende la classe de l'exercice précédent et rajouter une méthode ```distance()``` qui renvoie la distance du point par rapport à l'origine du repère (dans un repère orthonormé).


```python
# correction

class Point :
    def __init__(self,x,y):
        self.x = x
        self.y = y
    
    def distance(self) :
        return (self.x**2+self.y**2)**0.5
    
A = Point(3,5)
print(A.distance())
```

    5.830951894845301



```python

```
