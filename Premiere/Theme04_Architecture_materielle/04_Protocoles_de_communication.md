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
- Relions une machine ```192.168.0.10``` d'adresse MAC ```BC:81:81:42:9C:31```  à une machine ```192.168.0.11``` d'adresse MAC ```2A:AB:AC:27:D6:A7``` à travers un switch.  
![](data/K1.png)
- Observons la table SAT de notre switch : elle est vide, car aucune machine n'a encore cherché à communiquer.  
![](data/K2.png) 
- Lançons un ping depuis ```192.168.0.10``` vers ```192.168.0.11``` et observons les données échangées :  
![](data/K3.png) 
- Observons de plus près la première ligne de données échangées.  
![](data/K4.png) 
Cette première ligne est une requête **ARP**. ARP est un protocole qui s'interface entre la couche 3 / réseau (appelée dans la capture d'écran _Internet_)  et la couche 2 / liaison (appelée dans la capture d'écran _Réseau_). Comme indiqué dans le commentaire, elle consiste à un appel à tout le réseau : "Est-ce que quelqu'un ici possède l'IP ```192.168.0.11``` ?

**Message 1 : l'appel à l'aide**

Il faut comprendre à cette étape que l'adresse IP est totalement inutile pour répérer un ordinateur dans un sous-réseau. Ce sont les adresses MAC qui permettent de se repérer dans un sous-réseau. Les adresses IP, elles, permettent d'acheminer le message jusqu'au bon sous-réseau (elles n'intéressent donc que les routeurs).

Une analogie souvent prise est celle de l'adresse postale : lorsque une personne dit à une personne d'un même quartier "j'habite au 24 rue Lamartine", elle lui donne son adresse MAC.
⇒ L'adresse MAC est le renseignement obligatoire à l'intérieur d'un sous-réseau.


 Lorsque cette même personne dit à une connaissance de vacances "j'habite à Floirac, en Gironde", elle lui donne son adresse IP. 
 ⇒ L'adresse IP est le renseignement obligatoire à l'extérieur d'un sous-réseau.


Revenons à notre ping vers ```192.168.0.11```.

La commande ```arp -a``` effectuée dans un terminal de la machine ```192.168.0.10``` nous permet de voir qu'elle ne connaît encore personne dans son sous-réseau. La table de correspondance MAC ⮀ IP ne contient que l'adresse de broadcast ```255.255.255.255```, qui permet d'envoyer un message à tout le réseau.  
![](data/K5.png) 

Constatant qu'elle ne sait pas qu'elle est l'adresse MAC de ```192.168.0.11```, elle commence donc par envoyer un message à **tout** le sous-réseau, à l'adresse MAC de broadcast ```FF:FF:FF:FF:FF:FF```. Le switch va lui aussi lui aussi relayer ce message à tous les équipements qui lui sont connectés (dans notre cas, un seul ordinateur) 


**Message 2 : la réponse**
La machine ```192.168.0.11``` ayant reçu un message de ```192.168.0.10```, elle connait son adresse MAC. En effet, la commande ```arp -a``` donne 