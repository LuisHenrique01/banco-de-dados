from bisect import bisect
from gerar_nomes import gerar_nome_IBGE, gerar_lista_nomes
from random import randint as r
from datetime import date

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
for i in range(1, 500):
    HOSPEDE += "(%d,'%d-%d-%d','%s'),\n"%(i, r(1935, 2002), r(1, 12), r(1, 28), 
                                            gerar_nome_IBGE(sexo=['F','M'][r(0,1)], 
                                                            composto=[True, False][r(0,1)], 
                                                            femininos=femininos, masculinos=masculinos))
HOSPEDE += "(%d,'%d-%d-%d','%s');\n\n"%(500, r(1935, 2002), r(1, 12), r(1, 28), 
                                            gerar_nome_IBGE(sexo=['F','M'][r(0,1)], 
                                                            composto=[True, False][r(0,1)],
                                                            femininos=femininos, masculinos=masculinos))

FUNCIONARIO = """insert into FUNCIONARIO(cod_func, salario, dt_nascimento, nome)
values 
"""
for i in range(1, 30):
    FUNCIONARIO += "(%d, %d,'%d-%d-%d','%s'),\n"%(i, r(1500, 8000),r(1935, 2002), r(1, 12), r(1, 28), 
                                            gerar_nome_IBGE(sexo=['F','M'][r(0,1)], 
                                                            composto=[True, False][r(0,1)], 
                                                            femininos=femininos, masculinos=masculinos))
FUNCIONARIO += "(%d, %d,'%d-%d-%d','%s');\n\n"%(30, r(1500, 8000),r(1935, 2002), r(1, 12), r(1, 28), 
                                            gerar_nome_IBGE(sexo=['F','M'][r(0,1)], 
                                                            composto=[True, False][r(0,1)],
                                                            femininos=femininos, masculinos=masculinos))

RESERVA = """insert into REVERVA(cod_reserva, cod_func, cod_hosp, num, dt_prev_entrada, dt_prev_saida)
values 
"""

HOSPEDAGEM = """insert into HOSPEDAGEM(cod_hospeda, cod_func, cod_hosp, num, dt_entrada, dt_saida)
values 
"""

GERAR_DATA = lambda x: date.fromordinal(x.toordinal() + r(1, 40)).isoformat()

for i in range(1, 1000):
    dataR = date(r(2018, 2019), r(1, 12), r(1, 28))
    dataH = date(r(2018, 2019), r(1, 12), r(1, 28))
    if r(0, 1):
        cod_hosp = r(1, 500)
        ent = dataR.isoformat()
        sai = GERAR_DATA(dataR)
        num = r(1, 45)
        RESERVA += f"({i}, {r(1, 31)}, {cod_hosp}, {num}, , '{ent}', '{sai}'),\n"
        HOSPEDAGEM += f"({i}, {r(1, 31)}, {cod_hosp}, {num}, , '{ent}', '{sai}'),\n"
    else:
        RESERVA += f"({i}, {r(1, 31)}, {r(1, 500)}, {r(1, 45)}, , '{dataR.isoformat()}', '{GERAR_DATA(dataR)}'),\n"
        HOSPEDAGEM += f"({i}, {r(1, 31)}, {r(1, 500)}, {r(1, 45)}, , '{dataH.isoformat()}', '{GERAR_DATA(dataH)}'),\n"
dataR = date(r(2018, 2019), r(1, 12), r(1, 28))
dataH = date(r(2018, 2019), r(1, 12), r(1, 28))
RESERVA += f"(1000, {r(1, 31)}, {r(1, 500)}, {r(1, 45)}, , '{dataR.isoformat()}', '{GERAR_DATA(dataR)}'),\n"
HOSPEDAGEM += f"(1000, {r(1, 31)}, {r(1, 500)}, {r(1, 45)}, , '{dataH.isoformat()}', '{GERAR_DATA(dataH)}'),\n"



with open("inserts_hotel.sql", 'w') as ih:
    ih.write(APARTAMENTO)
    ih.write(HOSPEDE)
    ih.write(FUNCIONARIO)
    ih.write(RESERVA)
    ih.write(HOSPEDAGEM)