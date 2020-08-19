from random import randint
import requests, csv

"""Gera nomes aleatorios."""
def gerar_nome_aleatorio( **kargs):
    """Gerador de nomes totalmente aleatorio e diferentes, os argumentos max_tam e composto são aceitos."""
    max_tam = kargs.get('max_tam', randint(3, 10))
    composto = kargs.get('composto', False)
    nome = ''
    for i in range(max_tam):
        if i % 2 == 0:
            nome += chr(randint(97, 122))
        else:
            nome += list('aeiou')[randint(0,4)]
    if composto:
        sobrenome = gerar_nome_aleatorio().capitalize()
        return f'{nome} {sobrenome}'.capitalize()
    else:
        return nome.capitalize()

def gerar_nome_IBGE( sexo="M", composto=False, **kargs):
    '''Gera nomes "brasileiros" de acordo com o IBGE ou uma lista de nomes sugerida
    sexo(F - Feminino, M - Masculino), composto(True ou False).
    Caso deseje gerar varios nomes repetidamente chame o método gerar_lista_nomes que irá retorna
    uma lista de nomes femininos e masculinos então os passe como argumentos
    EX: gerar_nome_IBGE(femininos=f, masculinos=m)
    '''
    femininos, masculinos =  kargs.get('femininos', False), kargs.get('masculinos', False)
    if not (femininos and masculinos):
        femininos, masculinos = gerar_lista_nomes()
    if sexo == "F":
        nomes = femininos
    elif sexo == 'M':
        nomes = masculinos
    else:
        raise Exception('Passe sexo com M - Masculino ou F - Feminino')
    if composto:
        return nomes[randint(0, 10000)].lower().capitalize() + ' ' + nomes[randint(0, 20)].lower().capitalize()
    else:
        return nomes[randint(0, 10000)].lower().capitalize()
    

def gerar_lista_nomes():
    femininos = requests.get('https://raw.githubusercontent.com/MedidaSP/nomes-brasileiros-ibge/master/ibge-fem-10000.csv')
    masculinos = requests.get('https://raw.githubusercontent.com/MedidaSP/nomes-brasileiros-ibge/master/ibge-mas-10000.csv')
    masculinos = csv.DictReader(masculinos.text, delimiter=',')
    masculinos = [x['nome'] for x in masculinos if str(x['nome']).isalpha() and len(x['nome']) > 2]
    femininos = csv.DictReader(femininos.text, delimiter=',')
    femininos = [x['nome'] for x in femininos if str(x['nome']).isalpha() and len(x['nome']) > 2]
    return femininos, masculinos
