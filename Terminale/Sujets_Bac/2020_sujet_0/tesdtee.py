import sqlite3

#Connexion
connexion = sqlite3.connect('cinema.db')

#Récupération d'un curseur
c = connexion.cursor()


#while True :
#    nom = input("\nEntrez le nom d'un réalisateur : \n") 
#    data = (nom,)
#    c.execute("SELECT title FROM movies WHERE director = ?", data)
#    res = c.fetchall()
#    print("\nFilms de", nom, "présents dans la base :")
#    for rep in res :
#        print("  --", rep[0])

#Déconnexion
        
acteur = [str(input("Entrez le nom d'un réalisateur : \n"))]
 
films = c.execute('''SELECT title FROM movies WHERE director = ? ;''', acteur )
 
for film in films :
    print ("-- "+film[0])

        
        
        
        
        
        
        
connexion.close()