# Langage SQL

## 0. Du modèle relationnel au SGBD
Les considérations sur le modèle relationnel du [cours précédent](../4.1_Modele_relationnel/01_modele_relationnel.md) étaient uniquement théoriques. 

Il s'agissait de déterminer de manière la meilleure structure pour représenter les données et les relations qui les lient. 

Il convient maintenant d'aborder la partie logicielle : les SGBD (Systèmes de Gestion de Bases de Données).

[...]


## 1. Le langage SQL

![](data/extraitBO.png)

Dans toute la suite, nous allons travailler avec la base de données ```livres.db``` qui provient de l'ouvrage paru chez Ellipses, cité en bibliographie.

### 1.0 Différents moyens d'interroger la base de données
**Pré-requis :** téléchargez la base de données [livres.db](data/livres.db).

#### 1.0.1 En ligne : sqlonline
- Rendez vous sur https://sqliteonline.com/
- Par File / OpenDB, ouvrez le fichier  ```livres.db``` précédemment téléchargé.
- Écrivez votre requête plus cliquez sur Run.
![](data/sqlonline.png)

#### 1.0.2 Avec un logiciel externe : DB Browser for SQLite
- Installez ```DB Browser for SQLite```, téléchargeable à l'adresse https://sqlitebrowser.org/
- Ouvrez le fichier ```livres.db```
![](data/dbbrowser.png)

#### 1.0.3 Au sein d'un notebook Jupyter
- Si nécessaire, installez via le terminal les paquets suivants :
```
sudo pip3 install jupyter-sql
sudo pip3 install ipython-sql
sudo apt install python3-sql
``` 
- Dans un notebook Jupyter, votre première cellule doit être 
```
%load_ext sql
%sql sqlite:///livres.db
``` 
en ayant bien pris soin de mettre le fichier ```livres.db``` dans le même répertoire que votre fichier Jupyter.

Ensuite, chaque requête devra être précédée de la ligne ```%% sql```.
 ![](data/jupyter.png)