Classe Python integrada com Robot Framework
==========================================

Além de funções python, podemos utilizar classes para interagir com os arquivos .robot.
Usando classes, conseguimos fazer modificações, utilzando __init__ e invocando no .robot

1. Exemplo de biblioteca Python
-------------------------------

A classe abaixo possui o método mágico __init__ e cumprimenta

.. code-block:: python

	class MinhaBiblioteca:
		def __init__(self, saudacao='Olá', repetir=1):
			# parâmetros do __init__ tornam-se argumentos da Library
			self.saudacao = saudacao
			self.repetir = int(repetir)

		def cumprimenta(self, nome):
			"""Keyword pública: cumprimenta um nome."""
			return ' '.join([f"{self.saudacao}, {nome}!" ] * self.repetir)

	
Para que robot entenda a classe, é necessário salvar o arquivo com o mesmo nome da classe
Podemos importar somente essa classe para dentro do arquivo .robot, conforme voê pode observar


.. code-block:: robotframework

	*** Settings ***
	Library    MinhaBiblioteca.py    "Bom dia"    2


Quando importamos a biblioteca, o metodo init é iniciado automaticamente. Observe que importamos a classe e, no proprio Settings, 
passamos argumentos para rodar o __init__


3. Chamando métodos (keywords)
------------------------------

Com a clase importada, podemos invocar os metodos disponiveis.

.. code-block:: robotframework

	*** Test Cases ***
	Testar Cumprimento
		${res}=    Cumprimenta    João
		Should Be Equal    ${res}    Bom dia, João! Bom dia, João!


