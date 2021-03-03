### Exercice 1

Créer une fonction ```meme_sous_reseau(ip_a, ip_b, masque)``` qui renvoie un booléen indiquant si A et B sont partie du même sous-réseau.

Exercice à réaliser en Test Driven Developpement à partir du squelette de code ci-dessous, en testant chaque fonction après sa réalisation, jusqu'à la fonction finale.



```python
def convert_ip_to_list(ip):
    """
    entrée : ip (string) 
    sortie : liste d'entiers
    """
    # à vous

def test_convert_ip_to_list():
    assert convert_ip_to_list('192.168.0.1') == [192, 168, 0, 1]
    

def nb_to_binary_word(masque):
    """
    entrée : masque (int)
    sortie : string
    """
    # à vous
    
def test_nb_convert_to_binary_word():
    assert nb_to_binary_word(24) == '11111111111111111111111100000000'


def binary_word_to_list(word):
    """
    entrée : word (string de 32 caractères)
    sortie : liste de 4 entiers
    """
    # à vous


def test_binary_word_to_list():
    assert binary_word_to_list('11111111111111111111111100000000') == [255, 255, 255, 0]



def meme_sous_reseau(ip_a, ip_b, masque):
    """
    ip_a:  string contenant une IP (ex "192.168.0.1")
    ip_b : string contenant une IP
    masque : entier du masque en notation CIDR (ex : 24)
    renvoie un booléen indiquant si ip_a et ip_b sont dans
    le même sous-réseau
    """
    # à vous
    

def test_meme_sous_reseau():
    assert meme_sous_reseau("192.168.0.1", "192.168.1.3", 24) == False
    assert meme_sous_reseau("192.168.0.1", "192.168.1.3", 20) == True
    assert meme_sous_reseau("192.168.0.1", "192.168.0.3", 30) == True
```


### Exercice 2

On considère un réseau composé de plusieurs routeurs reliés de la façon suivante :


<p align="center">
<img src="data/ex1.png" width=40%/> 
</p>

Le protocole RIP permet de construire les tables de routage des différents routeurs, en indiquant pour chaque routeur la distance, en nombre de sauts, qui le sépare d’un autre routeur. Pour le réseau ci-dessus, on dispose des tables de routage suivantes :

<p align="center">
<img src="data/ex2.png" width=80%/> 
</p>

**Question 1**

1. Le routeur A doit transmettre un message au routeur G, en effectuant un nombre minimal de
sauts. Déterminer le trajet parcouru.
2. Déterminer une table de routage possible pour le routeur G obtenu à l’aide du protocole RIP.

**Question 2**

 Le routeur C tombe en panne. Reconstruire la table de routage du routeur A en suivant le
protocole RIP.
