
Setup e Teardown
=================

Este documento descreve as diretivas de configuração e limpeza no Robot Framework:

- Suite Setup: executado antes de todos os testes.
- Suite Teardown: executado depois de todos os testes.
- Test Setup: executado antes de cada keyword.
- Test Teardown: executado depois de cada keyword.

Exemplos
--------

Exemplo de arquivo de testes Robot (.robot) com Suite/Test Setup e Teardown:

.. code-block:: robotframework

	*** Settings ***
	Suite Setup    Preparar Ambiente da Suite
	Suite Teardown    Limpar Ambiente da Suite
	Test Setup    Preparar Teste
	Test Teardown    Limpar Teste

	*** Test Cases ***
	Caso de Teste 1
		Log    Executando Caso de Teste 1

	Caso de Teste 2
		Log    Executando Caso de Teste 2

Exemplo de keywords no mesmo arquivo (pode também estar em resource):

.. code-block:: robotframework

	*** Keywords ***
	Preparar Ambiente da Suite
		Log    Iniciando recursos compartilhados da suíte

	Limpar Ambiente da Suite
		Log    Finalizando recursos da suíte

	Preparar Teste
		Log    Configurando pré-condições do teste

	Limpar Teste
		Log    Restaurando estado após o teste

Notas
-----

- Suite Setup/Teardown são úteis para preparar e liberar recursos usados por todos os testes (por exemplo, iniciar um servidor ou limpar um banco de dados).
- Test Setup/Teardown são úteis para garantir que cada caso de teste comece em um estado conhecido e que qualquer limpeza necessária seja feita imediatamente após o teste.
- Se uma Suite Setup falhar, a suíte pode ser encerrada e os testes podem ser marcados como falhados ou ignorados dependendo da configuração.

Referências
----------

- Documentação oficial do Robot Framework: https://robotframework.org

