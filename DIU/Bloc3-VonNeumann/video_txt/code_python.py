def present_2(**kwargs):
    if 'surname' in kwargs.keys():
        a = kwargs['surname']
        print(f'je suis {a}') #valide
    if 'born' in kwargs.keys():
        b = kwargs['born']
        print(f"je suis né en {kwargs['born']}") # non valide
        
if __name__ == "__main__":
    present_2(surname='Alan', name='Turing', born=1912, died=1954)
    present_2(surname='Ada', name='Lovelace')
    present_2( name='Turing', born=1912)