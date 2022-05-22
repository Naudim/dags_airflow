from classMunicipio import Municipio

fontes = ["Armazenamento_processamento_massivo\Atividade_2\IDH_1991.csv","Armazenamento_processamento_massivo\Atividade_2\IDH_2010.csv"]

lista_municipio = []

for caminho in fontes:

    arquivo = open(caminho, "r", encoding="utf8")

    tamanho = arquivo.readlines() 
    count = 0

    while(count < len(tamanho)):
        if(count == 0):
            count += 1
            continue
        
        linha = tamanho[count]
        dados = linha.split(";")

        municipio = Municipio()
        municipio.ano = dados[0]
        municipio.codigo_estado = dados[1]
        municipio.estado = dados[2]
        municipio.codigo_municipio = dados[3]
        municipio.municipio = dados[4]
        municipio.esperanca_vida = float(dados[5])
        municipio.mortalidade = float(dados[6])

        lista_municipio.append(municipio)

        count += 1

    arquivo.close()

class Dicionario:

    dic = None

    def __init__(self):
        self.dic = {}

    def adicionarChave(self, chave):
        self.dic[chave] = 0
    
    def adicionarValor(self, chave, valor):
        self.dic[chave] = valor

    def procurarChave(self, chave):
        return self.dic.get(chave)

    def listarChaves(self):
        print(self.dic.keys())

    def listarItens(self):
        print(self.dic.items())

municipios = Dicionario()
municipios2010 = Dicionario()

"""Com base no Arquivos em anexos,  fazer um programa em Python para ler o arquivo e mostre:
a) Qual Munícipio tem maior mortalidade infantil  em 1991 e 2010"""
for dados in lista_municipio:
    nome_municipio = str(dados.municipio)

    if(dados.ano == "1991"):    
        municipios.adicionarChave(dados.municipio)
        municipios.adicionarValor(dados.municipio, dados.mortalidade)
    else:
        municipios2010.adicionarChave(dados.municipio)
        municipios2010.adicionarValor(dados.municipio, dados.mortalidade)

municipio_maior_mortalidade_1991 = max(municipios.dic, key=municipios.dic.get)
municipio_maior_mortalidade_2010 = max(municipios2010.dic, key=municipios2010.dic.get)

municipio_10menores_mortalidade_2010 = sorted(municipios2010.dic, key=municipios2010.dic.get)

print("O municipio com maior mortalidade em 1991 é " + municipio_maior_mortalidade_1991 + " com a taxa de " + str(municipios.dic[municipio_maior_mortalidade_1991]))
print("O municipio com maior mortalidade em 2010 é " + municipio_maior_mortalidade_2010 + " com a taxa de " + str(municipios.dic[municipio_maior_mortalidade_2010]) + str("\n"))

municipios.dic.clear()
municipios2010.dic.clear()

"""b) Qual tem a maior esperança de vida 1991 e 2010"""
for dados in lista_municipio:
    nome_municipio = str(dados.municipio)

    if(dados.ano == "1991"):    
        municipios.adicionarChave(dados.municipio)
        municipios.adicionarValor(dados.municipio, dados.esperanca_vida)
    else:
        municipios2010.adicionarChave(dados.municipio)
        municipios2010.adicionarValor(dados.municipio, dados.esperanca_vida)

municipio_maior_esperancavida_1991 = max(municipios.dic, key=municipios.dic.get)
municipio_maior_esperancavida_2010 = max(municipios2010.dic, key=municipios2010.dic.get)


municipio_10menores_esperancavida_2010 = sorted(municipios2010.dic, key=municipios2010.dic.get)

print("O municipio com maior esperança de vida em 1991 é " + municipio_maior_esperancavida_1991 + " com a taxa de " + str(municipios.dic[municipio_maior_esperancavida_1991]))
print("O municipio com maior esperança de vida em 2010 é " + municipio_maior_esperancavida_2010 + " com a taxa de " + str(municipios.dic[municipio_maior_esperancavida_2010]) + str("\n"))


"""c) Gerar um arquivo com as 10 Cidades com Menor mortalidade Infantil de 2010"""
arquivo = open("Armazenamento_processamento_massivo\Atividade_2\Cidades_com_Menor_mortalidade_2010.txt","w", encoding="utf8") 
for i in range(10):
    arquivo.write(municipio_10menores_mortalidade_2010[i])
    arquivo.write('\n')
arquivo.close()

print("\n")

"""d) Gerar um arquivo com as 10 Cidades com menor esperanca de vida de 2010"""
arquivo = open("Armazenamento_processamento_massivo\Atividade_2\Cidades_com_Menor_esperanca_vida_2010.txt","w", encoding="utf8") 
for i in range(10):
    arquivo.write(municipio_10menores_esperancavida_2010[i])
    arquivo.write('\n')
arquivo.close()