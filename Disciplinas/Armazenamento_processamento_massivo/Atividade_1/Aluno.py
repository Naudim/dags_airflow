from classAluno import Aluno

arquivo = open("Atividade_1\Aluno.txt", "r")

tamanho = arquivo.readlines() 
cont = 0
lista_alunos = []

while(cont < len(tamanho)):
    if(cont == 0):
        cont += 1
        continue
    linha = tamanho[cont]
    vetor = linha.split(";")
    aluno = Aluno()
    aluno.matricula = vetor[0]
    aluno.nome = vetor[1]
    aluno.curso = vetor[2]
    aluno.nota1 = float(vetor[3])
    aluno.nota2 = float(vetor[4])
    aluno.nota3 = float(vetor[5])
    aluno.media = (aluno.nota1 + aluno.nota2 + aluno.nota3) / 3
    lista_alunos.append(aluno)
    cont += 1

arquivo.close()


for dados in lista_alunos:
    print("Nome do Curso: " + dados.curso)
    print("Nome do Aluno: " + dados.nome)
    print("Matricula: " + dados.matricula)


    if(dados.media >= 8.5):
        print("Excelente: " + str(dados.media))
    elif (dados.media >= 7 and dados.media < 8.5):
        print("Bom : " + str(dados.media))
    else:
        print("Preocupante : " + str(dados.media))


    print("******")
 
