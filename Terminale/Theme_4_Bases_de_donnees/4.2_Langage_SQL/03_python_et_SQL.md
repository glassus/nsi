# Python et SQL / mini-projets

Nous allons créer et interroger une base de données ```sqlite``` avec le module ```sqlite3```  de Python.

### 1. Permiers exemples
#### 1.1 Création d'une table 

```python
import sqlite3

#Connexion
connexion = sqlite3.connect('mynewbase.db')

#Récupération d'un curseur
c = connexion.cursor()

# ---- début des instructions SQL

#Création de la table
c.execute("""
    CREATE TABLE IF NOT EXISTS bulletin(
    Nom TEXT,
    Prénom TEXT,
    Note INT);
    """)

# ---- fin des instructions SQL

#Validation
connexion.commit()


#Déconnexion
connexion.close()

``` 

- Le fichier ```mynewbase.db``` sera créé dans le même répertoire que le fichier source Python. Si fichier existe déjà, il est ouvert et peut être modifié.
- ```IF NOT EXISTS``` assure de ne pas écraser une table existante qui porterait le même nom. Si une telle table existe, elle n'est alors pas modifiée.
- La nouvelle table peut être ouverte avec ```DB Browser``` pour vérifier sa structure et ses données.

#### 1.2 Insertion d'enregistrements dans la table
Les morceaux de code ci-dessous sont à positionner entre les balises ```# ---- début des instructions SQL```  et ```# ---- fin des instructions SQL```.

##### 1.2.1 Insertion d'un enregistrement unique
```python
c.execute('''INSERT INTO bulletin VALUES ('Simpson', 'Bart', 17)''')
``` 

Pensez à vérifier avec  ```DB Browser``` si les modifications sont effectives.

##### 1.2.2 Insertion d'un enregistrement unique avec variable
```python
data = ('Simpson', 'Maggie', 2)
c.execute('''INSERT INTO bulletin VALUES (?,?,?)''', data)
``` 


##### 1.2.3 Insertion de multiples enregistrements
```python
lst_notes = [ ('Simpson', 'Lisa', 19), ('Muntz', 'Nelson', 4), ('Van Houten', 'Milhouse', 12) ]

c.executemany('''INSERT INTO bulletin VALUES (?, ?, ?)''', lst_notes)
``` 
Les différentes valeurs sont stockées au préalable dans une liste de tuples.

#### 1.3 Mini-projet 1
Créer un programme qui demande à l'utilisateur un nom et une note, en boucle. Les résultats sont stockés au fur et à mesure dans une base de données. Si le nom est égal à «Q» ou «q», le programme s'arrête.

### 2. Lecture des enregistrements
```python
import sqlite3

#Connexion
connexion = sqlite3.connect('mynewbase.db')

#Récupération d'un curseur
c = connexion.cursor()

data = ('Simpson', )

c.execute("SELECT Prénom FROM Bulletin WHERE Nom = ?", data)
print(c.fetchall())  


#Déconnexion
connexion.close()
``` 

Ce code renvoie ```[('Homer',), ('Lisa',), ('Maggie',)]```, ou une liste vide s'il n'y a pas de résultat à la requête.

#### 2.1 Mini-projet 2
Reprendre le mini-projet précédent, en rendant possible à l'utilisateur de rentrer des notes ou bien de les consulter.

*Exemple :*

![](data/mp2.gif)