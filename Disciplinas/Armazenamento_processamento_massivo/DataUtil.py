'''
Created on 24 de nov. de 2021

@author: nelsonjunior
'''

from datetime import datetime

class DataUtil:
    data = None 
    
    def __init__(self, data):
        self.data = data        
    
    def converteString(self):
        str_date = self.data
        date = datetime.strptime(str_date, '%d/%m/%Y').date()
        return date
    
    def buscaAno(self):
        str_date = self.data
        date = datetime.strptime(str_date, '%d/%m/%Y').date()
        return date.year
    
    def buscaDia(self):
        str_date = self.data
        date = datetime.strptime(str_date, '%d/%m/%Y').date()
        return date.day
    
    def buscaMes(self):
        str_date = self.data
        date = datetime.strptime(str_date, '%d/%m/%Y').date()
        return date.month
"""        
teste = DataUtil("25/11/2021")

print(teste.converteString())
print(teste.buscaAno())
print(teste.buscaDia())
print(teste.buscaMes())

"""

