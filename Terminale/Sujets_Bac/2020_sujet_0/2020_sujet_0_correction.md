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












































