from random import randint
fich = open("input.txt",'w')
dep = randint(1,5)
for k in range(10**5):
    dep += randint(1,5)
    v = str(dep)
    fich.write(v+"\n")
fich.close()
