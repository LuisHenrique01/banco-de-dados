from sqlalchemy import create_engine
engine = create_engine('postgresql+psycopg2://postgres:241002@localhost:5432/hotel')   

from random import randint as r
update = """"""

sintaxe = """UPDATE hospede SET nacionalidade = '{}' WHERE cod_hosp = {};\n"""

paises = 'Alemanha, Austrália, Canadá, Estados Unidos, França, Itália, Japão, Reino Unido, África do Sul, Arábia Saudita, Argentina, Brasil, China, Coreia do Sul, Índia, Indonésia, México, Rússia, Turquia'.split(', ')
with engine.connect() as connection:
    for i in range(1, 501):
        sql = sintaxe.format(paises[r(0, len(paises) - 1)], i)
        connection.execute(sql)
        update += sql
    
    

with open("updates_hotel.sql", 'w') as ih:
    ih.write(update)
    