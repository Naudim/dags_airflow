from datetime import datetime
from classJogo import Jogo

arquivo = open("Python\jogosCampeonato.txt", "r", encoding="utf-8")

tamanho = arquivo.readlines()

lista_jogos = []

for i in range(len(tamanho)):
    linha = tamanho[i]
    dados = linha.split(";")

    jogos = Jogo()

    jogos.rodada = dados[0]
    jogos.data = dados[1]
    jogos.horarioPartida = dados[2]
    jogos.diaSemana = dados[3]
    jogos.timeMandante = dados[4]
    jogos.timeVisitante = dados[5]
    jogos.timeVencedor = dados[6]
    jogos.estadio = dados[7]
    jogos.golsMandante = dados[8]
    jogos.golsVisitante = dados[9]
    jogos.estadoTimeMandante = dados[10]
    jogos.estadoTimeVisitante = dados[11]
    jogos.estadoTimeVencedor = dados[12]

    ano = date = datetime.strptime(jogos.data, '%d/%m/%Y').date()
    jogos.ano = ano.year

    lista_jogos.append(jogos)

arquivo.close()

for dados in lista_jogos:
    if((dados.timeVencedor == 'Corinthians') and (dados.timeVisitante == 'Corinthians')):   
        print("Jogo da " + dados.rodada + "ª rodada do campeonato")
        print("Data do jogo: " + dados.data + " às " + dados.horarioPartida + " horas (" + dados.diaSemana + ")")
        print(dados.estadio  + "\n")
        print("Placar")
        print(dados.timeMandante + " X " + dados.timeVisitante)
        print(str(dados.golsMandante).center(len(dados.timeMandante), " ") + " X " +  str(dados.golsVisitante).center(len(dados.timeVisitante), " ")  + "\n")

        print("O time vencedor foi o " + dados.timeVencedor  + "\n")
        print("************************///////*************************" + "\n")
    

"""1)Com base no arquivo do Campeonato Brasileiro de 2003 a 2020 em anexo faça:"""

"""a)Extraia todos os jogos que o seu time ganhou como visitante"""

for dados in lista_jogos:
    if((dados.timeVencedor == 'Corinthians') and (dados.timeVisitante == 'Corinthians')):   
        print("Jogo da " + dados.rodada + "ª rodada do campeonato")
        print("Data do jogo: " + dados.data + " às " + dados.horarioPartida + " horas (" + dados.diaSemana + ")")
        print(dados.estadio  + "\n")
        print("Placar")
        print(dados.timeMandante + " X " + dados.timeVisitante)
        print(str(dados.golsMandante).center(len(dados.timeMandante), " ") + " X " +  str(dados.golsVisitante).center(len(dados.timeVisitante), " ")  + "\n")

        print("O time vencedor foi o " + dados.timeVencedor  + "\n")
        print("************************///////*************************" + "\n")

"""b)Extraia todos os jogos que o seu time ganhou como Mandante"""

for dados in lista_jogos:
    if((dados.timeVencedor == 'Corinthians') and (dados.timeMandante == 'Corinthians')):   
        print("Jogo da " + dados.rodada + "ª rodada do campeonato")
        print("Data do jogo: " + dados.data + " às " + dados.horarioPartida + " horas (" + dados.diaSemana + ")")
        print(dados.estadio  + "\n")
        print("Placar")
        print(dados.timeMandante + " X " + dados.timeVisitante)
        print(str(dados.golsMandante).center(len(dados.timeMandante), " ") + " X " +  str(dados.golsVisitante).center(len(dados.timeVisitante), " ")  + "\n")

        print("O time vencedor foi o " + dados.timeVencedor  + "\n")
        print("************************///////*************************" + "\n")

"""c)Qual o ano que ele venceu mais jogos"""
class Dicionario:

    dic = None

    def __init__(self):
        self.dic = {}

    def adicionarChave(self, chave):
        self.dic[chave] = 0
    
    def adicionarValor(self, chave, valor: int):
        self.dic[chave] = int(self.dic[chave]) + valor

    def procurarChave(self, chave):
        return self.dic.get(chave)

    def listarChaves(self):
        print(self.dic.keys())

    def listarItens(self):
        print(self.dic.items())

jogos = Dicionario()
for dados in lista_jogos:
    if(dados.timeVencedor == 'Corinthians'):
        anoJogo = str(dados.ano)
        if(jogos.procurarChave(anoJogo) is not None):
            jogos.adicionarValor(anoJogo,1)
        else:
            jogos.adicionarChave(anoJogo)
            jogos.adicionarValor(anoJogo,1)

anoVencedor = max(jogos.dic, key=jogos.dic.get)

print("O ano de " + anoVencedor + " foi o ano que o Corinthians ganhou mais jogos, no total foram " + str(jogos.dic[anoVencedor]) + " jogos" + "\n")