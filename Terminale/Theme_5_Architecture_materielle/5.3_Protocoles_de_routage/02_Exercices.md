### Exercice 1
https://gist.github.com/glassus/df389e35611f5337bddd955580e48465

#### Début de correction 

```python
def convert_ip_to_list(ip):
    """
    entrée : ip (string) 
    sortie : liste d'entiers
    """
    return [int(k) for k in ip.split('.')]

def test_convert_ip_to_list():
    assert convert_ip_to_list('192.168.0.1') == [192, 168, 0, 1]
    

def nb_to_binary_word(masque):
    """
    entrée : masque (int)
    sortie : string
    """
    return '1'*masque + '0'*(32 - masque)
    
def test_nb_convert_to_binary_word():
    assert nb_to_binary_word(24) == '11111111111111111111111100000000'


def binary_word_to_list(word):
    """
    entrée : word (string de 32 caractères)
    sortie : liste de 4 entiers
    """
    return [int(word[8*k:8*(k+1)],2) for k in range(4)]

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