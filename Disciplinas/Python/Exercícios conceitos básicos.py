"""Exercicio 1 - 
    Faça um programa que mostre o tradicional "Hello Word" na tela
"""
texto = "Hello World"
print(texto)


"""Exercicio 2 - 
    Faça um programa que peça um número e então mostre a mensagem: O número informado foi [número]
"""
numero = input("Informe um número: ")
print("O númeto informado foi " + numero)


"""Exercicio 3 - (Sem estruturas de repetição)
    Faça um programa que peça 5 itens e suas respectivas quantidades e mostre na tela a lista de itens com quantidade,
    Item 1 - Quantidade: V
    Item 2 - Quantidade: W
    Item 3 - Quantidade: Y
    Item 4 - Quantidade: X
    Item 5 - Quantidade: Z
"""
item1 = input("Informe o nome do item: ")
qtde1 = int(input("Informe a quantidade do item 1:"))
item2 = input("Informe o nome do item: ")
qtde2 = int(input("Informe a quantidade do item 2:"))
item3 = input("Informe o nome do item: ")
qtde3 = int(input("Informe a quantidade do item 3:"))
item4 = input("Informe o nome do item: ")
qtde4 = int(input("Informe a quantidade do item 4:"))
item5 = input("Informe o nome do item: ")
qtde5 = int(input("Informe a quantidade do item 5:"))

print("Item 1 - " + item1 + " | Quantidade:" + str(qtde1))
print("Item 2 - " + item2 + " | Quantidade:" + str(qtde2))
print("Item 3 - " + item3 + " | Quantidade:" + str(qtde3))
print("Item 4 - " + item4 + " | Quantidade:" + str(qtde4))
print("Item 5 - " + item5 + " | Quantidade:" + str(qtde5))


"""Exercicio 4 - Crie uma ista de compra com as seguintes regras:
    É necessário um total de 5 frutas;

    A primeira fruta deve custar 1,00;
    A segunda fruta deve custar o dobro do valor da primeira;
    A terceira fruta deve custar metade do valor da primenta;
    A quarta fruta deve custar 3 vezes o valor da terceira;
    A quinta fruta deve custar metade do valor da quarta;

    Cada fruta deve possuir uma variável;
    Usar a menor quantidade possível de variáveis;
    Todas as frutas e seus valores devem ser impressos no seguinte formato;
        "A fruta __________ custa _________"
"""
valor = float(1.00)

fruta1 = input("Informe o nome da primeira fruta: ")
fruta2 = input("Informe o nome da segunda fruta: ")
fruta3 = input("Informe o nome da terceira fruta: ")
fruta4 = input("Informe o nome da quarta fruta: ")
fruta5 = input("Informe o nome da quinta fruta: ")

print("A fruta " + fruta1 + " custa R$ " + str(valor))
print("A fruta " + fruta2 + " custa R$ " +  str(2 * valor))
print("A fruta " + fruta3 + " custa R$ " +  str(valor / 2))
print("A fruta " + fruta4 + " custa R$ " +  str(3 * (valor / 2)))
print("A fruta " + fruta5 + " custa R$ " +  str((3 * (valor / 2)) / 2))


"""Exercicios - Dicionários
"""
pessoa = {"Nome":'Arnaldo', "Ultimo Nome":'Souza', "Idade":'34', "Curso":'Engenharia de dados', "Endereço":'Rua: Carvalho de souza'}

print("a) Imprima o dicionário completo")

print(pessoa.items())
print("*****")

print("b) Imprima cada um dos 5 itens separadamente")

print(pessoa["Nome"])
print(pessoa["Ultimo Nome"])
print(pessoa["Idade"])
print(pessoa["Curso"])
print(pessoa["Endereço"])
print("*****")

print("c) Exclua a chave CURSO do dicionário")

del pessoa["Curso"]
print("*****")

print("d) Altere o ULTIMO NOME para Lopes")

pessoa["Ultimo Nome"] = 'Lopes'
print("*****")

print("e) Imprima novamente o dicionário completo")

print(pessoa.items())
print("*****")

print("f) Imprima apenas o endeço")

print(pessoa["Endereço"])
print("*****")

print("g) Crie uma cópia do dicionário e altere Nome e Idade")

pessoaCopia = pessoa.copy()
pessoaCopia["Nome"] = 'Luisa'
pessoaCopia["Idade"] = '28'
print("*****")

print("h) Imprima o segundo dicionário completo")

print(pessoaCopia.items())
print("*****")


"""Exercicio
    Calculo de notas, DADOS:

    Nota 1 + Nota 2 / 2
    Se média <= 3 imprimir reprovado
    Se > 3 e < 5 imprimir optativa
    Se >= 5 imprimir aprovado
"""
nota1 = float(input("Informe a primeira nota: "))
nota2 = float(input("Informe a segunda nota: "))

resultado = nota1 + nota2
media = resultado / 2

print(resultado)
print(media)

if(media <= 3):
    print("reprovado")
elif(3 < media < 5):
    print("optativa")
else:
    print("aprovado")


"""Exercicio 
    Faça um programa que permita somar apaenas os números pares da sequência de inteiros contida no intervalo [x,y]
"""
inicio = int(input("Informe o número inicial: "))
termino = int(input("Informe o númeo final: "))

resultado = 0
i = inicio

while i <= termino:
    if( i % 2 == 0 ):
        resultado += i
    i += 1

print("A soma dos números pares do intervalo de " + str(inicio) + " até " + str(termino) + " é: " + str(resultado))


"""Exercicio
    Leia um número e calcule e imprima sua tabuada
"""
numero = int(input("Informe o número que você deseja obter a tabuada: "))
limite = int(input("Informe o tamanho da tabuada: "))

for i in range(limite + 1):
    print(numero * i)


"""Exercicio
    Escreva uma aplicação de dicionário com três funções: adicionar um termo ao dicionário, 
    procurar um termo no dicionário e listar todos os termos existentes
"""
class Dicionario:

    dic = None

    def __init__(self):
        self.dic = {}

    def adicionarChave(self, chave):
        self.dic[chave] = ''
    
    def adicionarValor(self, chave, valor):
        self.dic[chave] = valor

    def procurarChave(self, chave):
        print(self.dic.get(chave))

    def listarChaves(self):
        print(self.dic.keys())
    
pessoa = Dicionario()

pessoa.adicionarChave("Nome")
pessoa.listarChaves()
pessoa.procurarChave("Nome")
pessoa.adicionarValor("Nome", 'Arnaldo')
pessoa.procurarChave("Nome")