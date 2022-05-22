from classDisciplina import Disciplina
def leArquivo(nome_diretorio):
    arquivo = open(nome_diretorio, "r")
    
    tamanho = arquivo.readlines()
    cont = 0
    lista_disciplinas = []
        
    while(cont < len(tamanho)):
        if(cont == 0):
            cont += 1
            continue
        
        linha = tamanho[cont]
        vetor = linha.split(";")
        d = Disciplina()
        d.matricula = vetor[0]
        d.nome = vetor[1]
        d.nome_disciplina = vetor[2]
        d.nota1 = float(vetor[3])
        d.nota2 = float(vetor[4])
        d.media = (d.nota1 + d.nota2) / 2.0
      
        lista_disciplinas.append(d)
        cont += 1
    arquivo.close()
    
    return lista_disciplinas
	
def gravaArquivo(nome_diretorio, lista):
    arquivo = open(nome_diretorio, "w+")
    for dados in lista:
        arquivo.write("Nome da Discplina: " + dados.nome_disciplina + "\n")
        arquivo.write("Nome do Aluno: " + dados.nome + "\n")
        arquivo.write("Matricula: " + dados.matricula + "\n")
        
        if(dados.media >= 6):
            arquivo.write("Aprovado: " + str(dados.media) + "\n")
        elif (dados.media < 6 and  dados.media >= 4):
            arquivo.write("Especial : " + str(dados.media) + "\n")
        else:
            arquivo.write("Reprovado : " + str(dados.media) + "\n")
            
        arquivo.write("******" + "\n")
        
    arquivo.close()
	
entrada = "ArquivoCSV.csv"
saida = "Resultado.txt"
lista_notas = leArquivo(entrada)
gravaArquivo(saida, lista_notas)