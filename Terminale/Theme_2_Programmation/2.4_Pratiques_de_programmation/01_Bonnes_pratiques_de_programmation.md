# Bonnes pratiques de programmation

![](data/pep8.webp)

*extrait du site https://realpython.com/python-pep8/*

## 1. Conventions syntaxiques
La programmation est un art délicat : un simple caractère en trop peut provoquer une erreur pour le code tout entier (penser à un innocent caractère d'espace en début de ligne dans un code Python).
Mais même lorsqu'un code s'exécute sans erreur, il ne faut pas négliger l'aspect purement «esthétique» de celui-ci : il est nécessaire de respecter autant que possible des conventions typographiques, qui vont standardiser le code et le rendre ainsi plus lisible.

Ainsi pour chaque langage, il existe une «bible» de bonnes pratiques de présentation du code, qui visent à l'uniformiser. Pour Python, cette référence s'appelle la Python Enhancement Proposal 8, plus connue sous le nom de PEP8. 

Vous trouverez un excellent résumé de la PEP8 sur le site http://sametmax.com/le-pep8-en-resume/.

En voici quelques extraits :

### Les espaces

<p align="center">
<img src="data/standards.jpg" width=50%/> 
</p>

▶ Il faut mettre une espace (oui, en typographie, on dit «une» espace et non pas «un» espace) avant et après chaque opérateur de comparaison ou d'affectation (```=, ==, +, >, ...``` )

```python
# PAS BIEN 
a=3

# BIEN 
a = 3
```

```python
# PAS BIEN
if x>3:
    print("ok")

# BIEN
if x > 3:
    print("ok")
```

▶ Pour les opérateurs mathématiques, on essaie de reconstituer les groupes de priorité (lorsqu'il y en a) :

```python
# PAS BIEN
x = 3*2

# BIEN
x = 3 * 2
```

mais 

```python
# PAS BIEN
x = 3 * 2 + 5

# BIEN
x = 3*2 + 5
```

▶ On ne met pas d'espace à intérieur des parenthèses, des crochets ou des accolades :

```python
# PAS BIEN
for x in range( 5 ):
    print( 'bonjour' )

# BIEN
for x in range(5):
    print('bonjour')
```

▶ Pour les virgules, et les deux points : 
pas d'espace avant mais une espace après.

```python
# PAS BIEN
if color == (0,255,0) :
    print('vert')

# BIEN
if color == (0, 255, 0):
    print('vert')
```

### Les conventions de nommage

▶ Les variables à une lettre (comme ```i```, ```j```, ```k``` ) sont réservées aux indices (notamment dans les boucles).

▶ Les autres variables doivent avoir des noms explicites, éventuellement écrits en ```snake_case``` si plusieurs mots doivent être reliés.

```python
# PAS BIEN
if d == 1:
    cep += vm

# BIEN
if date == 1:
    compte_epargne += versement_mensuel
```


Rappel des différents types de casse :
- ```snake_case``` : les mots sont séparés par des underscores. Conseillé en Python.
- ```camelCase``` : les mots sont séparés par des majuscules mais la 1ère lettre est minuscule. Conseillé en Javascript.
- ```PascalCase``` : les mots sont séparés par des majuscules et la 1ère lettre est majuscule. Conseillé en C.
- ```kebab-case``` : les mots sont séparés par des tirets courts. Conseillé en HTML - CSS.

▶ Cas particulier des classes en Programmation Orientée Objet : leur nom doit commencer par une majuscule.

```python
# PAS BIEN
class voiture:
    def __init__(self, annee, marque, modele):
       #pass

# BIEN
class Voiture:
    def __init__(self, annee, marque, modele):
       #pass
```

## 2. Commentaires et docstrings

### 2.1 Commenter son code ? (ou pas)
<p align="center">
<img src="data/comment.jpg" width=50%/> 
</p>

La nécessité de commenter son code est assez controversée.  
Il est d'usage de dire qu'un code doit être assez **explicite** pour que le lecteur puisse le comprendre sans avoir à lire un commentaire. 

De fait, les commentaires sont parfois (souvent) superflus :
<p align="center">
<img src="data/cat.png" width=50%/> 
</p>

Et s'ils sont réellement nécessaires, il faut se poser la question : est-ce que ce code n'aurait pas pu être plus simple ? (attention, la réponse n'étant pas toujours oui)

<p align="center">
<img src="data/smart.jpeg" width=50%/> 
</p>

**Exemple :**

Considérons la fonction suivante.
```python
def f(c, t, n):
    # c est le capital de départ, t le taux annuel et n le nombre d'années
    return c*(1+t)**n  #renvoie le capital après n années
```
Elle est bien commentée. Mais si on croise la fonction ```f()``` ailleurs dans le code, se souviendra-t-on de son rôle ?

Il aurait mieux valu écrire :
```python
def capital_apres_n_annees(capital, taux, nombre_annees) :
    return capital*(1+taux)**nombre_annees
```
Ce code est plus long, mais assez explicite pour se passer de commentaires.

### 2.2 Le cas particulier des 


## 3. La programmation défensive : des ```assert``` pour sécuriser le code 

## 4. Les tests
### 4.1 Pourquoi des tests ?


<p align="center">
<img src="data/tester.jpg" width=50%/> 
</p>


Tester une fonction est la première chose que l'on fait (normalement...) lorsqu'on vient de finir de l'écrire. 

Par exemple, si on vient de construire la fonction ```valeur_absolue(n)```, il est fort probable qu'on aille taper ceci dans la console :

```python
>>> valeur_absolue(-3)
3
>>> valeur_absolue(0)
0
>>> valeur_absolue(7)
7
```

Deux remarques :
- ces tests sont longs à taper (3 commandes successives, à refaire à chaque test).
- ces tests correspondent à *ce qu'on veut que la fonction fasse*. On aurait pu d'ailleurs écrire ces tests avant même de commencer à écrire la fonction ```valeur_absolue(n)```.

Pourquoi donc ne pas regrouper tous ces tests au sein d'une même fonction ```test_valeur_absolue()``` ?

```python
def test_valeur_absolue():
    if valeur_absolue(-3) == 3 :
        print("ok")
    else:
        print("erreur")
        
    if valeur_absolue(0) == 0 :
        print("ok")
    else:
        print("erreur")
        
    if valeur_absolue(7) == 7 :
        print("ok")
    else:
        print("erreur")
```

En console, il suffit maintenant d'appeler la fonction ```test_valeur_absolue()``` :

```python
>>> test_valeur_absolue()
ok
ok
ok
```


### 4.2 Revoilà les ```assert```
### 4.3 Le module ```doctest```