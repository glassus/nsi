f = open("input.txt",'r')
l = f.readlines()
L = []
for k in l :
    L.append(int(k[:-1]))