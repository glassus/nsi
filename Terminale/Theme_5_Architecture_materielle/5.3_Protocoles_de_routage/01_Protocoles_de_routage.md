
# Protocoles de routage

<img src="data/banniere.png" width='100%' />

## 0. Résumé des épisodes précédents

- [cours](https://github.com/glassus/nsi/blob/master/Premiere/Theme04_Architecture_materielle/03_Architecture_reseau.md) de 1ère sur l'architecture d'un réseau
- [cours](https://github.com/glassus/nsi/blob/master/Premiere/Theme04_Architecture_materielle/04_Protocoles_de_communication.md) de 1ère sur les différents protocoles de communication dans un réseau.

**Notions essentielles :**
Lorsqu'une machine A, d'adresse IP_A veut discuter avec une machine B, d'adresse IP_B:
- La machine A calcule (grâce au masque de sous-réseau) si B est dans le même sous-réseau qu'elle, ou pas.
- Si oui, elle peut donc connaître l'adresse MAC de la carte réseau de la machine B (soit elle la possède déjà dans sa table ARP, soit elle la demande en envoyant un message de broadcast à tout le sous-réseau : «qui possède cette adresse IP_B ?»).
Elle envoie donc dans le sous-réseau une trame ayant pour entête l'adresse MAC de B : le switch lit cette trame, sait sur quel port est branché la machine B et lui envoie spécifiquement donc le message.
- Si B n'est pas dans le même sous-réseau que A, A mettra en entête de sa trame l'adresse MAC de la carte réseau du routeur, qui joue le rôle de passerelle. Le routeur va ouvrir la trame et va observer l'IP_B, à qui il doit remettre ce message. C'est maintenant que vont intervenir les protocoles de routage :
    - est-ce que B est dans le même sous-réseau que le routeur ?
    - est-ce que B est dans un autre sous-réseau connu du routeur ?
    - est-ce que B est totalement inconnu du routeur ?


Ces questions trouveront des réponses grâce à **table de routage** du routeur.

## 1. Tables de routage

![](data/tables.png)


