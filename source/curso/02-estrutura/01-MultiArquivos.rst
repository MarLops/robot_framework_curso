Estrutura de Robot Framework com três arquivos
================================================

Em projetos mais complexos, o ideial seria separar em diversos arquivos para facilitar as responsabilidades.
O robot permiti que arquivos importe outros arquivos. 
Neste exemplo, vamos construir um projeto com a seguinte divisão

1. Um arquivo para keywords.
2. Um arquivo para variáveis.
3. Um arquivo de testes que importa os dois anteriores e executa as keywords.

Arquivo de keywords
-------------------

O arquivo de keywords contém a definição das ações reutilizáveis.
Exemplo de conteúdo:

.. code-block:: robotframework

   *** Keywords ***
   Abrir Aplicacao
       Log    Abrindo a aplicação
   Fechar Aplicacao
       Log    Fechando a aplicação

Arquivo de variáveis
--------------------

O arquivo de variáveis define valores que podem ser usados em vários testes.
Exemplo de conteúdo:

.. code-block:: robotframework

   *** Variables ***
   ${URL}    http://exemplo.com
   ${USUARIO}    usuario
   ${SENHA}    senha123


Neste arquivo, podemos pegar valor da variavel de ambiente e setar um valor default se não existes.
Para usar variavel de ambiente, utilize % na frente

.. code-block:: robotframework

   *** Variables ***
   ${URL}    %{URL=http://exemplo.com}
  


Arquivo principal de teste
--------------------------

O arquivo principal importa os arquivos de keywords e variáveis e chama as keywords.
Exemplo de conteúdo:

.. code-block:: robotframework

   *** Settings ***
   Resource    Keywords.robot
   Resource    Variaveis.robot

   *** Test Cases ***
   Testar Aplicacao Completa
       Abrir Aplicacao
       Log    Usando URL ${URL}
       Fechar Aplicacao

Dessa forma, a manutenção fica mais simples, pois keywords e variáveis ficam separados do arquivo de testes.
Podemos fazer estrutura de pastas para facilitar 