from classDisciplina import Disciplina

arquivo = open("ArquivoCSV.csv", "r")

tamanho = arquivo.readlines()
cont = 0
lista_alunos = []

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
    lista_alunos.append(d)
    cont += 1

arquivo.close()


for dados in lista_alunos:
    print("Nome da Disciplina: " + dados.nome_disciplina)
    print("Nome do Aluno: " + dados.nome)
    print("Matricula: " + dados.matricula)


    if(dados.media >= 8.5):
        print("Bom: " + str(dados.media))
    elif (dados.media >= 7 and dados.media < 8.5):
        print("Regular : " + str(dados.media))
    else:
        print("Recuperação : " + str(dados.media))


    print("******")
 
