Linhas de Comando do Robot Framework
===================================

O Robot Framework é executado principalmente por linha de comando. A seguir estão alguns argumentos úteis
para controlar saída, variáveis e seleção de testes.

Diretório de saída
-------------------

Use `--outputdir` para definir um diretório onde o Robot deve salvar os arquivos de saída gerados,
como `output.xml`, `log.html` e `report.html`.

Exemplo:

.. code-block:: bash

   robot --outputdir resultados tests/

Variáveis na linha de comando
----------------------------

Use `--variable` para passar variáveis ao teste no momento da execução. O formato é
`NOME:valor`.

Exemplo:

.. code-block:: bash

   robot --variable AMBIENTE:homologacao --variable TIMEOUT:30 tests/

Isso permite usar `${AMBIENTE}` e `${TIMEOUT}` dentro dos seus testes e recursos.

Executar apenas uma task/teste
-----------------------------

Para executar apenas um teste ou task específico, use a opção `--test` (ou `-t`).

Exemplo:

.. code-block:: bash

   robot --test "Login com credenciais válidas" tests/minha_suite.robot

Se quiser executar uma suíte inteira, use `--suite`.

Exemplo:

.. code-block:: bash

   robot --suite MinhaSuite tests/

Executar todos os arquivos Robot em uma pasta
-------------------------------------------

Basta apontar para a pasta que contém os arquivos `.robot`. O Robot Framework
executará todos os arquivos e subpastas encontrados.

Exemplo:

.. code-block:: bash

   robot tests/

Também é possível usar curingas do shell para selecionar apenas arquivos específicos:

.. code-block:: bash

   robot tests/*.robot
