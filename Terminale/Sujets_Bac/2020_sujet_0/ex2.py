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