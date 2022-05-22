nota1 = int(input('Digite a primeira nota:'))
nota2 = int(input('Digite a segunda nota:'))

media = (nota1 + nota2) / 2

if(media <= 3):
    print('reprovado')
elif(media > 3 and media < 5):
    print('optativa')
else:
    print('aprovado')