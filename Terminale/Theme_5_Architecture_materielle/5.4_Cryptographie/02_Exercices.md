### Exercice 1

**Utilisation des biblitohèques cryptographiques du module ```sympy```.**
Documentation : [https://docs.sympy.org/latest/modules/crypto.html](https://docs.sympy.org/latest/modules/crypto.html)

Décoder la phrase ```RYTVJKGCLJWRTZCVRMVTLEDFULCVHLZWRZKKFLKRMFKIVGCRTV```, sachant qu'elle a été chiffrée par décalage.


### Exercice 2
**Chiffrage affine**

Principe du chiffrage affine :
- Chaque lettre est codée par son rang, en commençant à 0 (A->0, B->1, ..., Z->25)
- On applique à chaque rang la transformation affine 
<p align="center">
<img src="https://render.githubusercontent.com/render/math?math=\large f(x) = ax\+b  26">
</p>