Tags, Timeout e Metadata em Settings e Test Cases
==================================================

Tags
----

No Robot Framework, `Tags` permitem organizar e filtrar casos de teste, tarefas e também coletar resultados por grupo.

Exemplo em Settings:

.. code-block:: robotframework

    *** Settings ***
    Documentation    Exemplo de tags em suite
    Test Tags       smoke

A keyword 'Test tags' forca todos os testes terem a tag smoke


Podemos adicionar também tags no proprio teste e podemos adicionar mais de uma tag

Exemplo em Test Cases:

.. code-block:: robotframework

    *** Test Cases ***
    Validar Login
        [Tags]    login    crítico
        Log    Teste de login

Executar apenas com Tags
------------------------

Para executar somente testes ou tasks marcados com tags específicas, use os argumentos `--include` e `--exclude` no comando `robot`. Isso faz com que apenas os casos correspondentes sejam executados e registrados em `log.html` e `report.html`.

Exemplo:

.. code-block:: bash

    robot --include smoke caminho/da/suite.robot
    robot --include login --exclude crítico caminho/da/suite.robot

No `log.html` e `report.html`, você verá:

- apenas os testes executados conforme o filtro de tags.
- as tags atribuídas a cada caso.
- o resumo de execução refletindo os casos incluídos/excluídos.

Timeout
-------

`Timeout` define um tempo máximo para execução de um caso de teste ou keyword. Se o prazo for ultrapassado, o teste falha.

Exemplo em Settings:

.. code-block:: robotframework

    *** Settings ***
    Default Timeout    1 minute

Neste caso, todas as testes terão timeout de 1 minuto por default

Exemplo em Test Cases:

.. code-block:: robotframework

    *** Test Cases ***
    Esperar Resposta
        [Timeout]    30 seconds
        Sleep    1 second

Neste caso, personalizamos para que somente esse teste tenha timeout

Metadata
--------

`Metadata` serve para adicionar informações extras, como versão, autor ou módulo. É útil para relatórios e documentação.

Exemplo em Settings:

.. code-block:: robotframework

    *** Settings ***
    Metadata    Versão    1.0
    Metadata    Autor    Equipe QA

Exemplo em Test Cases:

.. code-block:: robotframework

    *** Test Cases ***
    Validar Página Inicial
        [Documentation]    Verifica elementos da página inicial
        Log    Passou na validação

Resumo
------

- Tags: organizam e filtram execuções.
- Timeout: controla o tempo máximo de execução.
- Metadata: adiciona informações extras às suítes.
- Task: usado para ações ou processos, não necessariamente validações.
- Test Case: usado para validações de funcionalidades.
