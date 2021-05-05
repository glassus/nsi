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

**Il n'y a donc aucun obstacle à considérer une programme comme une simple donnée, pouvant être reçue en paramètre par un autre programme.** (voire par lui-même !)

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
Après tout, un programme est une suite d'instructions (le code-source), et peut donc être, comme on l'a vu, le paramètre d'entrée d'un autre programme qui l'analyserait. 
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


**Tentative d'écriture de ```halt``` en Python :**

```python
def halt(prog, x):
    if "prog(x) s'arrête" :   # ce code n'est pas encore abouti ...
        return True
    else :
        return False
```

Nous en resterons là pour l'instant dans l'écriture de ce programme. Nous allons nous en servir pour construire d'autres programmes.

### 2.3 Amusons-nous avec ce programme ```halt```.

Considérons le programme :

```python
def sym(prog):
    if halt(prog, prog) == True :
        while True :
            pass
    else :
        return 1
```

On peut remarquer que le programme ```halt``` est appelé avec comme paramètres ```prog, prog```, ce qui signifie que ```prog``` se prend lui-même en paramètre. On rappelle que ce n'est pas choquant, un code-source étant une donnée comme une autre.

<p align="center">
<img src="data/halt3.png" , width=40%/> 
</p>

Ce programme ```sym``` reçoit donc en paramètre un programme ```prog```, et :
- va rentrer dans une boucle infinie si ```prog(prog)``` s'arrête.
- va renvoyer 1 si  ```prog(prog)``` ne s'arrête pas.

### 2.4 Un léger problème ...

Puisqu'un programme peut prendre en paramètre son propre code-source, que donnerait l'appel à ```sym(sym)``` ?

Deux cas peuvent se présenter, suivant si ```halt(sym, sym)``` renvoie ```True``` ou ```False```.

<p align="center">
<img src="data/halt4.png" , width=80%/> 
</p>

* **cas n°1** : ```halt(sym, sym)``` renvoie ```True```, ce qui signifie que ```sym(sym)```  devrait s'arrêter. Mais dans ce cas-là, l'exécution de ```sym(sym)``` rentre dans une boucle infinie. C'est une contradiction.


* **cas n°2** : ```halt(sym, sym)``` renvoie ```False```, ce qui signifie que ```sym(sym)```  rentre dans une boucle infinie. Mais dans ce cas-là, l'exécution de ```sym(sym)``` se termine correctement et renvoie la valeur 1. C'est une contradiction.


### 2.5 Conclusion

Nous venons de prouver que notre programme ```halt```, censé prédire si un programme ```prog``` peut s'arrêter sur une entrée ```x```, **NE PEUT PAS EXISTER**.

Ce résultat théorique, d'une important cruciale, s'appelle **le théorème de l'arrêt**.

<p align="center">
<img src="data/turing16.jpg" , width=40%/> 
</p>


Ce résultat a été démontré par [Alan Turing](https://fr.wikipedia.org/wiki/Alan_Turing) en 1936, dans un article intitulé *«On computable numbers, with an application to the Entscheidungsproblem»*.

<p align="center">
<img src="data/turing.png" , width=100%/> 
</p>


Pour sa démonstration, il présente un modèle théorique de machine capable d'exécuter des instructions basiques sur un ruban infini, les [machines de Turing](https://fr.wikipedia.org/wiki/Machine_de_Turing).

À la même époque, le mathématicien [Alonzo Church](https://fr.wikipedia.org/wiki/Alonzo_Church) démontre lui aussi ce théorème de l'arrêt, mais par un moyen totalement différent, en inventant le [lambda-calcul](https://fr.wikipedia.org/wiki/Lambda-calcul).

Tous deux mettent ainsi un terme au rêve du mathématicien allemand [David Hilbert](https://fr.wikipedia.org/wiki/David_Hilbert), qui avait en 1928 posé la question de l'existence d'un théorème capable de répondre «oui» ou «non» à n'importe quel énoncé mathématique posé sous forme décisionnelle («ce triangle est-il rectangle ?», «existe-t-il un nombre premier pair ?»)

Cette question, appelée «problème de la décision», ou *Entscheidungsproblem* en allemand, est résolue par le problème de l'arrêt : un tel théorème ne peut pas exister, puisque par exemple, aucun algorithme ne peut répondre «oui» ou «non» à la question "ce programme va-t-il s'arrêter ?».


Concernant le théorème de l'arrêt, il est intéressant de remarquer que ce résultat sera étendu plus tard par [le théorème de Rice](https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_Rice).

Ce résultat démontre que toutes les propriétés sémantiques (non évidentes) d'un programme sont indécidables :
- «ce programme va-t-il s'arrêter» (on vient de le démontrer)
- «ce programme va renvoyer la valeur 12» 
- «ce programme ne renverra jamais un message d'erreur» 
- ...

Pour démontrer ceci, [Rice](https://en.wikipedia.org/wiki/Henry_Gordon_Rice) ramène toutes ces questions à celle du théorème de l'arrêt.





