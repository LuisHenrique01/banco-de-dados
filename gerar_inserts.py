from bisect import bisect
from gerar_nomes import gerar_nome_IBGE, gerar_lista_nomes
from random import randint as r
gerar_lista_nomes()

femininos, masculinos = gerar_lista_nomes()
APARTAMENTO = """insert into APARTAMENTO(num, cod_cat)
values 
"""
GERAR_NUM_APARTAMENTO = lambda x, points=range(1, 51, 10): bisect(points, x)
for i in range(1, 45):
    APARTAMENTO += '(%d, %d),\n'%(i, GERAR_NUM_APARTAMENTO(i))
APARTAMENTO += '(%d, %d);\n\n'%(45, GERAR_NUM_APARTAMENTO(45))

HOSPEDE = """insert into HOSPEDE(cod_hosp, dt_nascimento, nome)
values 
"""
for i in range(1, 501):
    HOSPEDE += "(%d,'%d-%d-%d','%s'),\n"%(i, r(1935, 2002), r(1, 12), r(1, 28), 
                                            gerar_nome_IBGE(sexo=['F','M'][r(0,1)], 
                                                            composto=[True, False][r(0,1)], 
                                                            femininos=femininos, masculinos=masculinos))
HOSPEDE += "(%d,'%d-%d-%d','%s');\n\n"%(i, r(1935, 2002), r(1, 12), r(1, 28), 
                                            gerar_nome_IBGE(sexo=['F','M'][r(0,1)], 
                                                            composto=[True, False][r(0,1)],
                                                            femininos=femininos, masculinos=masculinos))

FUNCIONARIO = """insert into FUNCIONARIO(cod_func, salario, dt_nascimento, nome)
values 
"""
for i in range(1, 31):
    FUNCIONARIO += "(%d, %d,'%d-%d-%d','%s'),\n"%(i, r(1500, 8000),r(1935, 2002), r(1, 12), r(1, 28), 
                                            gerar_nome_IBGE(sexo=['F','M'][r(0,1)], 
                                                            composto=[True, False][r(0,1)], 
                                                            femininos=femininos, masculinos=masculinos))
FUNCIONARIO += "(%d, %d,'%d-%d-%d','%s');\n\n"%(i, r(1500, 8000),r(1935, 2002), r(1, 12), r(1, 28), 
                                            gerar_nome_IBGE(sexo=['F','M'][r(0,1)], 
                                                            composto=[True, False][r(0,1)],
                                                            femininos=femininos, masculinos=masculinos))


with open("inserts_hotel.sql", 'w') as ih:
    ih.write(APARTAMENTO)
    ih.write(HOSPEDE)
    ih.write(FUNCIONARIO)