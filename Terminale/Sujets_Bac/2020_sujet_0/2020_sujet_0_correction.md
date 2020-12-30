## 2020 - Correction du sujet 0


### Exercice 1

#### Question 1
Après exécution, la pile ```Q``` contiendra (de haut en bas) : ```8 - 5 - 2 - 4``` 

#### Question 2
 1. Fonction ```hauteur_pile``` 
```python
def hauteur_pile (P):
    Q = creer_pile_vide()
    n = 0
    while not (est_vide(P)):
        n = n + 1  # <- ???
        x = depiler(P)
        empiler (Q , x )
    while not ( est_vide ( Q )):
        x = depiler(Q) # <- ???
        empiler (P , x )
    return n # <- ???
```

2. Fonction ```max_pile``` 

```python
def max_pile(P, i):
    Q = creer_pile_vide()
    x = depile(P)
    empiler(Q, x)
    maximum = x
    j = 1
    for k in range(1, i):
        x = depile(P)
        empiler(Q, x)
        if x > maximum :
            maximum = x
            j = k + 1
    while not(est_vide(Q)):
        x = depile(Q)
        empiler(P, x)    
    return j
 ```

#### Question 3

```python
def retourner(P, j):
    Q = creer_pile_vide()
    R = creer_pile_vide()
    for i in range(j):
        x = depile(P)
        empile(Q, x)
    for i in range(j):
        x = depile(Q)
        empile(R, x)
    for i in range(j):
        x = depile(R)
        empile(P, x)
```

#### Question 4

```python
def tri_crepes(P):
    i = hauteur(P)
    while i > 1 :
        indice_max = max_pile(P, i)
        retourner(P, indice_max)
        retourner(P, i)
        i = i - 1
```


### Exercice 2

#### Question 1
1. Un chemin allant de la case (0,0) à la case (2,3) comporte obligatoirement 2 déplacements vers le bas.
2. Chaque chemin allant de la case (0,0) à la case (2,3) comporte donc obligatoirement 3 déplacements vers la droite et 2 déplacements vers le bas. Donc 5 nouvelles cases sont visitées. En comptant la case de départ, tous les chemins contiennent donc 6 cases : ils sont bien de longueur 6.

#### Question 2
- A : (0,0) - (0,1) - (0,2) - (0,3) - (1,3) - (2,3) → longueur 11
- B : (0,0) - (0,1) - (0,2) - (1,2) - (1,3) - (2,3) → longueur 10
- C : (0,0) - (0,1) - (0,2) - (1,2) - (2,2) - (2,3) → longueur 14
- D : (0,0) - (0,1) - (1,1) - (1,2) - (1,3) - (2,3) → longueur 9
- E : (0,0) - (0,1) - (1,1) - (1,2) - (2,2) - (2,3) → longueur 13
- F : (0,0) - (0,1) - (1,1) - (2,1) - (2,2) - (2,3) → longueur 12
- G : (0,0) - (1,0) - (1,1) - (1,2) - (1,3) - (2,3) → longueur 10
- H : (0,0) - (1,0) - (1,1) - (1,2) - (2,2) - (2,3) → longueur 14
- I : (0,0) - (1,0) - (1,1) - (2,1) - (2,2) - (2,3) → longueur 13
- J : (0,0) - (1,0) - (2,0) - (2,1) - (2,2) - (2,3) → longueur 16

La somme maximale est donc obtenue par le chemin J, et vaut 16.

#### Question 3
1. La tableau T' est  :

| | | ||
|---|----|----|----|
| 4 | 5  | 6  | 9  |
| 6 | 0  | 8  | 10 |
| 9 | 10 | 15 | 16 |


2. Les cases [0][j] (avec j ≠ 0) sont les cases de la première ligne. Pour y accéder, le seul chemin est de passer par la case située à gauche, donc la case [0][j-1].
Le chemin de somme maximale qui mène à [0][j] est donc la somme de la case [0][j]
et du chemin maximal qui a mené à la case précédente [0][j-1].
D'où l'égalité T'[0][j] = T[0][j] + T'[0][j-1]


#### Question 4
1. Si i et j sont différents de 0, la case [i][j] n'est ni sur le bord gauche, ni sur le bord haut. Pour y accéder, la case précédente est donc forcément la case [i-1][j] (case du haut) ou la case [i][j-1] (case de gauche).
La somme maximale pour aller en [i][j] sera donc la somme de la case [i][j] avec la plus grande valeur entre T'[i-1][j] et T'[i][j-1].
D'où l'égalité T'[i][j] = T[i][j] + max(T'[i][j-1], T'[i-1][j])


#### Question 5
1. Si i et j sont tous les deux égaux à 0, le chemin est donc de la case (0,0) vers la case (0,0) : la valeur à renvoyer est donc égale à T[0][0].

2.

```python
T = [[4,1,1,3],[2,0,2,1],[3,1,5,1]]

def somme_max(T, i, j):
    if (i, j) == (0, 0):   # le cas de base
        return T[0][0]
    elif i == 0 :          # si on est sur tout en haut, on revient vers la gauche
        return T[0][j] + somme_max(T, 0, j - 1)
    elif j == 0 :          # si on est sur tout à gauche, on revient vers le haut
        return T[i][0] + somme_max(T, i - 1, 0)
    else :                # sinon, on revient en choisissant la meilleure case précédente
        return T[i][j] + max(somme_max(T, i - 1, j), somme_max(T, i, j - 1))
```

3. Le problème initial est de trouver la somme maximale pour tous les chemins possibles allant de la case (0,0) à la case (n − 1,p − 1). 
D'après le code précédent, il suffira d'appeler ```somme_max(T, n-1, p-1)```.


























