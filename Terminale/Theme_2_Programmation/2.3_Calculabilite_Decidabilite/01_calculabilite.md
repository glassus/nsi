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

Il n'y a donc aucune difficulté à considérer une programme comme une simple donnée, pouvant être reçue en paramètre par un autre programme.

> À titre anecdotique, on pourra exécuter avec intérêt cette instruction Python :
> ```a='a=%r;print(a%%a)';print(a%a)``` 
> Ce type de code (magique !) existe dans tous les langages et s'appelle une [quine](https://fr.wikipedia.org/wiki/Quine_(informatique)).



