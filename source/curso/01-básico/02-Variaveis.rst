Variáveis no Robot Framework
============================



No Robot Framework, variáveis são usadas para armazenar valores , igual ao python. Elas facilitam a manutenção e a legibilidade do código, permitindo que valores sejam definidos uma vez e referenciados em vários lugares.

Criando Variáveis
-----------------

Existem várias maneiras de criar variáveis no Robot Framework:

1. **Variáveis Globais**: Definidas na seção ***Variables*** de um arquivo de teste ou recurso.

2. **Variáveis Locais**: Definidas dentro de uma keyword ou teste usando a sintaxe ``${variavel} = valor``.

3. **Variáveis de Ambiente**: Acessadas usando ``%{ENV_VAR}``.
 


Criando Variáveis Localmente
-----------------------

Para criar uma variável local dentro de uma keyword ou teste, basta usar a sintaxe ``${variavel} = valor``. Por exemplo:

.. code-block:: robot

   *** Tasks ***
   Exemplo de Variável Local
       ${mensagem}  Set Variable    Hello, Robot Framework!
       Log    ${mensagem}


Observe que utilizamos o keyword Set Variable para atribuir o valor "Hello, Robot Framework!" à variável ${mensagem}. Em seguida, usamos a keyword Log para exibir o valor da variável.
Segue um exemplo com duas tarefas usando a mesma variável local:

.. code-block:: robot

   *** Tasks ***
   Tarefa 1
       ${mensagem}  Set Variable    Hello from Task 1!
       Log    ${mensagem}

   Tarefa 2
       ${mensagem}  Set Variable    Hello from Task 2!
       Log    ${mensagem}



A Seção ***Variables***
-----------------------

A seção ***Variables*** é usada para definir variáveis que são visíveis em todo o arquivo de teste ou recurso. Ela deve ser colocada no início do arquivo, após a seção ***Settings***, se houver.

Sintaxe básica:

.. code-block:: robot

   *** Variables ***
   ${URL}    http://example.com
   ${NUMERO}    42

A variavels URL foi definida com o valor ``http://example.com``, ou seja, uma string, enquanto
a variável NUMERO foi definida com o valor ``42``, ou seja, um número inteiro.
Por se trarar da seção de variáveis, não é necessário usar o keyword Set Variable para atribuir os valores. Basta definir a variável e seu valor diretamente na seção.

A seção ***Variables***  permite também usar os keywords 'Documentation' e 'Metadata' para adicionar descrições e informações adicionais sobre as variáveis, como mostrado no exemplo abaixo:




Acessando variaveis de ambientes
-----------------------


Além das variaveis que podemos criar, podemos acessar variáveis de ambiente do sistema operacional usando a sintaxe ``%{ENV_VAR}``. Por exemplo, para acessar a variável de ambiente ``HOME`` no Linux ou ``USERPROFILE`` no Windows, podemos usar:
O exemplo abaixo mostra algumas variáveis de ambiente comuns, como acessar a pasta atual, ou lista qual sistema operacional está sendo utilizado:

.. code-block:: robot

   *** Tasks ***
   Exemplo de Variáveis de Ambiente
       Log    A pasta atual é: %{CURDIR}
       Log    O sistema operacional é: %{OS}

As variaveis de ambientes são escritas em letras maiúsculas e são acessadas usando %{} ao invés de ${} como as variáveis normais.
O link mostra uma lista de variáveis de ambiente pré-definidas pelo Robot Framework: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#predefined-variables

Varias complexas
---------------------------------------------------------

Alguams vezes , precisamos que a variavel seja um objeto mais complexo , como dicionário ou lista
No caso de lista, usamos a seguinte sintaxe:

.. code-block:: robot

   *** Variables ***
   @{LISTA}    item1    item2    item3


Para acessar os itens da lista, usamos a sintaxe ``@{LISTA}[index]``. Por exemplo, para acessar o segundo item da lista, usamos ``@{LISTA}[1]``.

No caso de dicionário, usamos a seguinte sintaxe:

.. code-block:: robot

   *** Variables ***
   &{DICIONARIO}    chave1=value1    chave2=value2


Para acessar os valores do dicionário, usamos a sintaxe ``&{DICIONARIO}[chave]``. Por exemplo, para acessar o valor associado à chave ``chave1``, usamos ``&{DICIONARIO}[chave1]``.

Para criar lista e dicionários dentro das tarefas, é necessário utilizar os keywords Create List e Create Dictionary, respectivamente. Por exemplo:

.. code-block:: robot

   *** Tasks ***
   Exemplo de Lista e Dicionário
       @{lista_local}    Create List    a    b    c
       &{dicionario_local}    Create Dictionary    x=1    y=2



Passando Variáveis via Comando Robot
-------------------------------------

Em determinadas ocasioes, queremos rodar um robot mas mudando as variáveis sem precisar modificar o código fonte. Para isso, o Robot Framework permite passar variáveis diretamente pelo comando de execução.

Sintaxe:

.. code-block:: bash

   robot --variable VARIAVEL:valor arquivo.robot

Exemplo:

.. code-block:: bash

   robot --variable URL:http://test.com --variable NUMERO:42 teste.robot

Isso permite executar testes com diferentes configurações sem modificar o código fonte.


O arquivo :download:`02-Variaveis.robot <02-Variaveis.robot>` possui exemplos de variáveis locais, globais, de ambiente, listas e dicionários.




exercícios
1. Crie uma variável global chamada ``Curso`` com o valor ``Robot framework`` e use essa variável em uma tarefa para logar a mensagem "Olá, estou começando a aprender Robot Framework!".

2. Crie duas tarefas que utilizam a mesma variável local chamada ``Mensagem``. Na primeira tarefa, defina a variável com o valor "Esta é a primeira tarefa" e logue essa mensagem. Na segunda tarefa, defina a variável com o valor "Esta é a segunda tarefa" e logue essa mensagem.