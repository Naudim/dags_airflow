'''
Created on 25 de nov. de 2021

@author: nelsonjunior
'''

arquivo = open("ArquivoCSV.csv", "r")

tamanho = arquivo.readlines()
cont = 0
    
while(cont < len(tamanho)):
    linha = tamanho[cont]
    cont += 1
    print(linha)

arquivo.close()