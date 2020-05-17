# Protocoles de communication dans un réseau

## I. Modèle OSI, modèle Internet

![](data/OSI.png)

Les bits transmis d'un ordinateur à un autre contiennent, en plus des données _utiles_ (le mot «bonjour» dans un email), une multitude de données (tout aussi utiles) qui vont aider à l'acheminement de ces bits au bon endroit, puis au bon ordinateur, puis au bon logiciel. 
Les différents protocoles qui régissent cette transmission sont regroupés dans ce qui est appelé un **modèle**. Deux modèles synthétisent ces protocoles :
- le **modèle Internet** (ou modèle **TCP/IP**, 1974), organisé en **4** couches : liaison, réseau, transport, application.
- le **modèle OSI** (Open Systems Interconnection, 1984), organisé en **7** couches : physique, liaison, réseau, transport, session, présentation,application.

Ces deux modèles coïncident suivant le schéma ci-dessus. Dans la suite de ce cours, nous évoquerons les couches par leur numéro dans le modèle OSI.

Lors de la préparation d'un message à envoyer (une requête GET, par exemple), cette requête va successivement être **encapsulée** en descendant à travers chaque couche.  
La trame qui est émise par l'ordinateur émetteur du message sera partiellement décapsulée au cours de son parcours sur le réseau, notamment lors du passage à travers les switchs (équipements de réseau travaillant sur la couche 2 / liaison, avec les adresses MAC), ou bien à travers les routeurs (équipements de réseau travaillant sur la couche 3 / réseau, avec les adresses IP), avant d'être totalement décapsulée lors de la réception par l'ordinateur destinataire.

## II. Observation des trames avec Filius

### 1. Ping à travers un switch
Vous pouvez télécharger le fichier [ping_switch.fls](data/ping_switch.fls).

- Relions une machine ```192.168.0.10``` d'adresse MAC ```BC:81:81:42:9C:31```  à une machine ```192.168.0.11``` d'adresse MAC ```2A:AB:AC:27:D6:A7``` à travers un switch.  
![](data/K1.png)
- Observons la table SAT de notre switch : elle est vide, car aucune machine n'a encore cherché à communiquer.  
![](data/K2.png) 
- Lançons un ping depuis ```192.168.0.10``` vers ```192.168.0.11``` et observons les données échangées :  
![](data/K3.png) 
- Observons de plus près la première ligne de données échangées.  
![](data/K4.png) 
Cette première ligne est une requête **ARP**. ARP est un protocole qui s'interface entre la couche 3 / réseau (appelée dans la capture d'écran _Internet_)  et la couche 2 / liaison (appelée dans la capture d'écran _Réseau_). Comme indiqué dans le commentaire, elle consiste à un appel à tout le réseau : "Est-ce que quelqu'un ici possède l'IP ```192.168.0.11``` ?

**Message 1 : « Qui possède l'IP ```192.168.0.11``` ? »**

Il faut comprendre à cette étape que l'adresse IP est totalement inutile pour répérer un ordinateur dans un sous-réseau. Ce sont les adresses MAC qui permettent de se repérer dans un sous-réseau. Les adresses IP, elles, permettent d'acheminer le message jusqu'au bon sous-réseau (elles n'intéressent donc que les routeurs).


Revenons à notre ping vers ```192.168.0.11```.

La commande ```arp -a``` effectuée dans un terminal de la machine ```192.168.0.10``` nous permet de voir qu'elle ne connaît encore personne dans son sous-réseau. La table de correspondance IP ⮀ MAC ne contient que l'adresse de broadcast ```255.255.255.255```, qui permet d'envoyer un message à tout le réseau.  
![](data/K5.png) 

Constatant qu'elle ne sait pas quelle est l'adresse MAC de ```192.168.0.11```, la machine ```192.168.0.10``` commence donc par envoyer un message à **tout** le sous-réseau, par l'adresse MAC de broadcast ```FF:FF:FF:FF:FF:FF```. Le switch va lui aussi lui aussi relayer ce message à tous les équipements qui lui sont connectés (dans notre cas, un seul ordinateur) 


**Message 2 : « Moi ! »**
La machine ```192.168.0.11``` s'est reconnu dans le message de broadcast de la machine ```192.168.0.10```. Elle lui répond pour lui donner son adresse MAC.  

![](data/K6.png) 

À partir de ce moment, la machine ```192.168.0.10``` sait comment communiquer avec ```192.168.0.11```. Elle l'écrit dans sa table ```arp``` :  

![](data/K7.png) 


Le switch, qui a vu passer sur ses ports 0 et 1 des messages venant des cartes MAC ```BC:81:81:42:9C:31```  et ```2A:AB:AC:27:D6:A7```, peut mettre à jour sa table SAT :  

![](data/K9.png) 

Par la suite, il saura sur quel port rediriger les messages destinés à ces deux adresses MAC. Un switch est un équipement de réseau de la couche 2 du modèle OSI, il ne sait pas lire les adresses IP.

**Message 3 : le ping est envoyé**

![](data/K8.png) 

Schématisons cette trame Ethernet (couche 2 du modèle OSI) :

![](data/trame1.png) 

**Message 4 : le pong est retourné**

![](data/K10.png) 


![](data/trame2.png) 



### 2. Ping à travers un routeur

Vous pouvez télécharger le fichier [ping_routeur.fls](data/ping_routeur.fls).

![](data/schema_routeur.png) 

L'objectif est d'observer les différentes trames lors d'un ping entre :
- la machine ```192.168.0.1 / 24``` (adresse MAC ```F9:E1:D6:0B:29:03``` ) et
- la machine ```192.168.1.1 / 24``` (adresse MAC ```D3:79:96:B8:5C:A4``` )

Le routeur est configuré ainsi :
- interface sur le réseau A :
    - IP : ```192.168.0.254``` 
    - MAC : ```77:C2:22:C9:5C:E7``` 
- interface sur le réseau B :
    - IP : ```192.168.1.254``` 
    - MAC : ```66:E5:4E:7D:0B:B0``` 


**Étape 0 : le routeur signale sa présence**
Lors de l'observation des messages reçus ou émis par la machine ```192.168.0.1```, on peut être intrigué par ce tout premier message reçu, de la part du routeur : 

![](data/K11.png) 

On peut y distinguer les 4 couches du modèle internet. Le routeur, par ce message distribué à tous les éléments du sous-réseau A (il envoie un message équivalent sur son sous-réseau B), déclare sa présence, et le fait qu'il possède deux interfaces, une pour chaque réseau. Dans cette trame figure son adresse MAC, les membres de son sous-réseau pourront donc lui envoyer un message pour qu'il joue son rôle de passerelle.


**Étape 1 : de ```192.168.0.1``` vers le routeur**
La machine ```192.168.0.1 / 24``` calcule que la machine ```192.168.1.1 / 24``` avec laquelle elle veut communiquer n'est **pas** dans son sous-réseau (voir [ce cours)](https://github.com/glassus/nsi/blob/master/Premiere/Theme04_Architecture_materielle/03_Architecture_reseau.md).  
Elle va donc envoyer son message à sa passerelle, qui est l'adresse du routeur dans son sous-réseau. 

Cette première trame est :

![](data/trame3.png) 


**Étape 2 : le routeur décapsule la trame**

Le routeur est un équipement de réseau de couche 3 (couche réseau). Il doit observer le contenu du paquet IP pour savoir, suivant le procédé de **routage** (voir cours de Terminale), où, acheminer ce paquet.

Dans notre cas, l'adresse IP ```192.168.1.1```de destination lui est accessible : elle fait partie de son sous-réseau.

Le routeur va modifier la valeur du TTL (Time To Leave), en la décrémentant de 1. Si, après de multiples routage, cette valeur devenait égale à 0, ce paquet serait détruit. Ceci a pour but d'éviter l'encombrement des réseaux avec des paquets ne trouvant pas leur destination.

Dans notre cas, le routeur va laisser intacte l'adresse IP Source. Ce n'est pas toujours le cas. Dans le cas classique de la box qui relie votre domicile à internet, le routeur contenu dans celle-ci va remplacer l'adresse locale de votre ordinateur ou smartphone (ex ```192.168.0.26```) par son IP publique (celle apparaissant sur whatsmyip.com, par exemple). Elle effectue ce qu'on appelle une translation d'adresse (NAT). En affectant à chaque machine de votre domicile un port particulier, elle pourra ainsi rediriger le trafic entrant à la bonne machine.

Le routeur va ré-encapsuler le paquet IP modifié, et créer une nouvelle trame Ethernet en modifiant :
- l'adresse MAC source : il va mettre l'adresse MAC de son interface dans le sous-réseau B.
- l'adresse MAC de destination : il va mettre l'adresse MAC de ```192.168.1.1 ``` (qu'il aurait peut-être récupérée au préalable par le protocole ARP)

Cette deuxième trame est donc :

![](data/trame4.png) 

On peut observer dans Filius cette trame, en se positionnant sur l'interface ```192.168.1.254 ``` du routeur, ou sur ```192.168.1.1 ``` :

![](data/K12.png) 


En suivant le même principe, la machine ```192.168.1.1 ``` pourra envoyer son _pong_.