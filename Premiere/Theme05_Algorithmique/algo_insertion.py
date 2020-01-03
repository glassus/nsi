a = [3, 7, 1, 5, 0]

def tri(l) :
    for k in range(1,len(l)):
        cle = l[k]
        i = k-1
        while  i>=0 and l[i] > cle :
            l[i+1] = l[i]
            i = i -1
        l[i+1] = cle
tri(a)
print(a)