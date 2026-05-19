.. _ouvinte-listener:

Ouvinte (Listener) do Robot Framework
=====================================

Esse arquivo explica como criar um Listener em Python (Listener.py) para o
Robot Framework, qual seu propósito e fornece um exemplo simples.

O que é um Listener?
---------------------

Um Listener é uma classe que recebe eventos durante a execução dos testes do
Robot Framework (por exemplo: start/stop de suíte, start/stop de caso de teste,
keywords, logs). Serve para integrar com sistemas externos, gerar relatórios
personalizados, capturar screenshots, entre outros.

Como criar Listener.py
----------------------

1. Crie um arquivo Python, por exemplo Listener.py.
2. Declare uma classe que implemente métodos especiais que o Robot chama.
3. Exemplo básico abaixo.

Exemplo de Listener.py
----------------------

.. code-block:: python

	# Listener.py
	class MyListener:
		ROBOT_LISTENER_API_VERSION = 3

		def __init__(self, output=None):
			# output: parâmetro opcional passado via linha de comando
			self.output = output

		def start_suite(self, name, attrs):
			# chamado quando uma suíte inicia
			print(f"Iniciando suíte: {name}")

		def end_suite(self, name, attrs):
			# chamado quando uma suíte termina
			print(f"Finalizando suíte: {name} Status: {attrs.get('status')}")

		def start_test(self, name, attrs):
			# chamado quando um teste inicia
			print(f"Iniciando teste: {name}")

		def end_test(self, name, attrs):
			# chamado quando um teste termina
			print(f"Finalizando teste: {name} Status: {attrs.get('status')}")

Uso do Listener
----------------

Execute o Robot Framework passando o listener:

.. code-block:: bash

	robot --listener Listener.MyListener[:argumento] testes/

Observações
-----------

- ROBOT_LISTENER_API_VERSION define a versão da API de listener (3 é comum).
- Os métodos podem receber diferentes argumentos dependendo da versão da API.
- Você pode implementar apenas os métodos que precisa (start_suite, end_test,
  start_keyword, end_keyword, message, log_message, entre outros).

Exemplo prático — capturar falhas e salvar um log:

.. code-block:: python

	class FailLogger:
		ROBOT_LISTENER_API_VERSION = 3

		def end_test(self, name, attrs):
			if attrs.get('status') == 'FAIL':
				with open('falhas.log', 'a', encoding='utf-8') as f:
					f.write(f"{name} - {attrs.get('message')}\n")

Referências
----------

- Documentação oficial dos Listeners: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#listener-interfaces
