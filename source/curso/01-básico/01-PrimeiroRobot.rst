Primeiro Robot
===============

Este documento explica como criar um arquivo ``.robot`` no Robot Framework, como executá-lo e descreve as seções **Settings** e **Tasks**.

Criando um Arquivo .robot
-------------------------

Os arquivos que o framework utiliza não são arquivos ``.py``, e sim arquivos ``.robot``. Essa extensão utiliza ``keywords`` (tarefas), ao invés de funções e variáveis escritas em Python.

Uma keyword é uma palavra ou frase que representa uma ação a ser executada. A seguir, temos um exemplo básico de keyword:

Exemplo de keyword::

    Log    Olá, Robot Framework!

Neste exemplo, a keyword ``Log`` é usada para registrar a mensagem ``Olá, Robot Framework!`` no relatório de execução.

Para melhor entendimento, vamos comparar com uma função em Python::

    def Log(message):
        print(message)

Conforme você pode ver, a keyword ``Log`` é semelhante a uma função em Python. Ela recebe argumentos e executa um comando.

Para criar um arquivo ``.robot``, além das keywords, é necessário entender a estrutura do arquivo, que é dividida em seções. Neste primeiro tutorial, vamos discutir somente a seção **Tasks** (algumas vezes chamada de **Test Cases**).

A seção **Tasks** é onde você define as keywords que serão executadas. Segue um exemplo de arquivo ``.robot`` com a seção **Tasks**::

    *** Tasks ***
    Criar Log
        Log    Verificando a página inicial...
        Log To Console    This will appear in the console
        Log    <b>Bold HTML message</b>    html=True

Para iniciar a seção, é necessário usar três asteriscos seguidos do nome da seção, neste caso, ``Tasks``.

Observe que a separação dos argumentos é feita através de espaços ou tabulações, ao invés de vírgulas como no Python. A indentação é importante, pois indica que as keywords estão associadas à tarefa ``Criar Log``.

Em seguida, definimos quais tarefas serão executadas e os passos que compõem essa tarefa (as keywords).

Neste simples exemplo, a tarefa ``Criar Log`` executa três keywords:

- ``Log``
- ``Log To Console``
- outro ``Log`` com formatação HTML

A primeira keyword ``Log`` registra a mensagem ``Verificando a página inicial...`` no relatório de execução.

A segunda keyword ``Log To Console`` exibe a mensagem ``This will appear in the console`` durante a execução.

A terceira keyword ``Log`` registra a mensagem ``<b>Bold HTML message</b>`` no relatório. Observe que passamos o argumento nomeado ``html=True`` para indicar que a mensagem deve ser interpretada como HTML.

Semelhante a uma função em Python, as keywords podem receber argumentos e executar ações específicas. A diferença é que as keywords são escritas em um formato mais legível e fácil de entender, o que torna o Robot Framework uma ferramenta poderosa para automação de testes.

O arquivo :download:`01-PrimeiroRobot.robot <01-PrimeiroRobot.robot>` possui a seção **Tasks** com a tarefa ``Criar Log`` e as keywords mencionadas acima.

Para executar o arquivo ``.robot``, utilize os comandos abaixo::

    cd source/curso/01-basico
    uv run robot 01-PrimeiroRobot.robot

Caso não esteja utilizando o ``uv``::

    cd source/curso/01-basico
    robot 01-PrimeiroRobot.robot

No terminal, você verá a seguinte saída:

.. image:: ../imagens/PrimeiroRobotExecucao.png
   :width: 500px
   :align: center
   :alt: Execução do primeiro robô no terminal

A saída mostrará:

- quais tarefas foram executadas;
- o status de cada uma (passou ou falhou);
- os arquivos ``output.xml``, ``log.html`` e ``report.html``.

Esses arquivos serão explicados no tutorial :doc:`03-AnalisandoResultados`.

Exercícios
-----------

1. Crie um arquivo ``.robot`` com uma tarefa chamada ``Minha Primeira Tarefa`` e adicione a seguinte keyword:

   - ``Log To Console    Esta mensagem aparecerá no console``

Resposta no documento:

:download:`01-Exercicio01.robot <respostas/01-Exercicio01.robot>`

2. Pesquise na documentação de keywords da biblioteca padrão e adicione a keyword ``Sleep`` para fazer o teste esperar por 2 segundos antes de exibir a mensagem no console.

Documentação da keyword ``Sleep``:

`BuiltIn - Sleep <https://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Sleep>`_

Resposta no documento:

:download:`01-Exercicio02.robot <respostas/01-Exercicio02.robot>`