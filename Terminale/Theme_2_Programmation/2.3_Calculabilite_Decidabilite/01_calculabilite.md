<!---

<p align="center">
<img src="data/banniere.png" width='100%' />
--->
<p align="center">
<img src="data/BO.png" width='80%' />
</p>


# Calculabilité, décidabilité

## 1. Un programme comme paramètre d'un programme

Les codes que nous manipulons ressemblent souvent à cela :
```python
def accueil(n):
    for k in range(n):
        print("bonjour")
```

Le programme s'appelle ```accueil```, et pour fonctionner il a besoin d'un paramètre, qui sera ici un nombre entier ```n```.

Voici comment nous pouvons représenter notre machine ```accueil```, son paramètre d'entrée (5) et sa sortie (les 5 «bonjour»)

<p align="center">
<img src="data/m1.png" , width=30%/> 
</p>

Maintenant, enregistrons le code suivant dans un fichier ```test.py``` :
```python
def accueil(n):
    for k in range(n):
        print("bonjour")

accueil(5)
```

Pour exécuter ce code, nous devons taper dans un terminal l'instruction suivante :
```python3 test.py```, ce qui donnera 
<p align="center">
<img src="data/term.png" , width=40%/> 
</p>

Le programme utilisé est alors ```python3```, qui prend comme paramètre le programme ```test.py```. Ce paramètre ```test.py``` est un ensemble de caractères qui contient les instructions que le programme ```python3``` va interpréter. 

L'illustration correspondante sera donc :

<p align="center">
<img src="data/m2.png" , width=30%/> 
</p>
 

Mais nous pouvons aller encore plus loin : l'instruction ```python3 test.py``` est tapée dans mon Terminal Linux, qui lui-même est un programme appelé ```Terminal```.

Et donc :
<p align="center">
<img src="data/m3.png" , width=30%/> 
</p>


Conclusion :

**Il n'y a donc aucun obstacle à considérer une programme comme une simple donnée, pouvant être reçue en paramètre par un autre programme.**

> À titre anecdotique, on pourra exécuter avec intérêt cette instruction Python :
> ```a='a=%r;print(a%%a)';print(a%a)``` 
> Ce type de code (magique !) existe dans tous les langages et s'appelle une [quine](https://fr.wikipedia.org/wiki/Quine_(informatique)).



## 2. Mon programme va-t-il s'arrêter ?

### 2.1 Un exemple

Considérons le programme suivant :

```python
def countdown(n):
    while n != 0 :
        print(n)
        n = n - 1
    print("fini")
```

En l'observant attentivement, je peux prévoir que ```countdown(10)``` affichera les nombres de 10 à 1 avant d'écrire "fini". Puis le programme s'arrêtera.

Mais que va provoquer ```countdown(10.8)``` ?

Comme la variable ```n``` ne sera jamais égale à 0, le programme va rentrer dans une boucle infinie, il ne s'arrêtera jamais. Mauvaise nouvelle. 
J'ai pu prévoir ceci en regardant attentivement le code de mon programme. J'ai «remarqué» qu'une variable ```n``` non entière provoquerait une boucle infinie.

**Question :**
Est-ce qu'un programme d'_analyse de programmes_ aurait pu faire cela à ma place ?


### 2.2 Une machine pour prédire l'arrêt ou non d'un programme.
Après tout, un programme est une suite d'instructions (un code source), et peut donc être, comme on l'a vu, le paramètre d'entrée d'un programme qui l'analyserait. 
Un tel programme (appelons-le ```halt```) prendrait en entrées :
- un paramètre ```prog``` (le code-source du programme)
- un paramètre  ```x```, qui serait le paramètre d'entrée de ```prog```.

 L'instruction ```halt(prog, x)``` renverrait ```True``` si ```prog(x)``` s'arrête, et ```False``` si ```prog(x)``` ne s'arrête pas.
 

<p align="center">
<img src="data/halt1.png" , width=30%/> 
</p>



**Exemple** : 
- ```halt(countdown, 10)``` renverrait ```True```.
- ```halt(countdown, 10.8)``` renverrait ```False```. 

<p align="center">
<img src="data/halt2.png" , width=60%/> 
</p>










