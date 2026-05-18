
Como importar funções Python para serem usadas como Keywords
==========================================================

Neste exemplo mostramos como transformar funções Python em Keywords do Robot Framework
usando o decorador ``@keyword`` (decorador). O processo é simples:

- Crie um arquivo Python com suas funções decoradas.
- Importe o arquivo (ou módulo) na sua suite Robot com a diretiva ``Library``.
- Use as funções decoradas diretamente como keywords.

Exemplo em Python (arquivo: mylib.py)
-----------------------------------

.. code-block:: python

	from robot.api.deco import keyword

	@keyword("Soma Dois Numeros")
	def soma(a, b):
		"""Retorna a soma de dois números.

		O nome do keyword será 'Soma Dois Numeros' conforme definido no decorador.
		"""
		return float(a) + float(b)

	# Também é possível usar sem passar nome; o nome do keyword será o nome da função.
	@keyword
	def multiplica(a, b):
		return float(a) * float(b)

Como importar e usar no Robot Framework
--------------------------------------

Crie um ficheiro de teste Robot (por exemplo tests.robot) e importe o arquivo Python
usando a diretiva ``Library``. Você pode passar o caminho relativo ou absoluto.

.. code-block:: robotframework

	*** Settings ***
	Library    path/to/mylib.py

	*** Test Cases ***
	Teste Soma
		${resultado}=    Soma Dois Numeros    2    3
		Should Be Equal As Numbers    ${resultado}    5

	Teste Multiplica
		${r}=    multiplica    4    5
		Should Be Equal As Numbers    ${r}    20

Observações
-----------

- O decorador ``@keyword`` está disponível em ``robot.api.deco`` a partir das versões
  modernas do Robot Framework.
- Por default, todas as função são mapeadas como keyword, porém para melhor identificação,é aconselhavel usar o decorador
- O decorador not_keyword permite que a função não seja disponibilizada como keyword


