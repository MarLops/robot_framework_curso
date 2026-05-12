Primeiro Robot
==============

Este documento explica como criar um arquivo .robot no Robot Framework, como executá-lo e descreve as seções **Settings** e **Task**.

Criando um Arquivo .robot
-------------------------

Os arquivos que o framework utiliza não são arquivos .py e sim  .robot. Essa nova extensão utiliza `keywords` (tarefas), ao invés de funções/variaveis escritas em python.
A keyword é uma palavra ou frase que representa uma ação a ser executada. A seguite, possio um exemplo básico de keyword

Exemplo de keyword::

    Log    Olá, Robot Framework!


Neste exemplo, a keyword ``Log`` é usada para registrar a mensagem "Olá, Robot Framework!" no relatório de execução.
Para melhor entendimento, vamos comparar com uma função em Python::

    def Log(message):
        print(message)


Conforme você pode ver, a keyword ``Log`` é semelhante a uma função em Python. Ela recebe argumentos e executa um comando.

Para criar um arquivo .robot, além das keywords, é necessário entender a estrutura do arquivo, que é dividida em seções. Neste primeiro tutorial, vamos discutir somente a seção  **Task** (Algumas vezes chamada de **Test Cases**).
A seção **Task** é onde você define as keywords que serão executadas.Segue um exemplo de arquivo .robot com a seção **Task**:

    *** Tasks ***
    Criar Log
        Log    Verificando a página inicial...
        Log To Console    This will appear in the console
        Log    <b>Bold HTML message</b>    html=True


Para iniciar a seção, é necessário usar três asteriscos seguidos do nome da seção, neste caso, ``Tasks``. Observe que a separação dos argumentos é feito através do tab, ao invés de vírgula como no python. A identação é importante, pois indica que as keywords estão associadas à tarefa "Criar Log".
Em seguida, definimos quais tarefas serão executadas (neste caso, criar uma terafa chamada "Criar Log") e os passos que compõem essa tarefa (as keywords).
Neste simples exemplo, a tarefa "Criar Log" executa três keywords: ``Log``, ``Log To Console`` e outro ``Log`` com formatação HTML.
A primeira keyword ``Log`` registra a mensagem "Verificando a página inicial..." no relatório de execução. 
A segunda keyword ``Log To Console`` exibe a mensagem "This will appear in the console" no console durante a execução. 
A terceira keyword ``Log`` registra a mensagem "<b>Bold HTML message</b>" no relatório de execução. Observe que passamos outro argumento mas explicitamos o nome do argumento (html=True) para indicar que a mensagem deve ser interpretada como HTML.
Semelhante a função em Python, as keywords podem receber argumentos e executar ações específicas. A diferença é que as keywords são escritas em um formato mais legível e fácil de entender, o que torna o Robot Framework uma ferramenta poderosa para automação de testes.

O arquivo :doc:`01-PrimeiroRobot.robot` possui a seção **Task** com a tarefa "Criar Log" e as keywords mencionadas acima.
Para rodar o arquivo .robot, basta rodar o comando

    cd source/curso/01-básico
    uv run robot 01-PrimeiroRobot.robot

Caso não esteja utilizando o uv

    cd source/curso/01-básico
    robot 01-PrimeiroRobot.robot


No terminal, você notará a saída

.. figure:: ../images/PrimeiroRobotExecucao.png
   :width: 500px
   :align: center


A saída mostrará quais tarefas foram executadas, o status de cada uma (passou ou falhou) e os arquivos Output, Log e Report (Esses arquivos serão explicados no tutorial 03-AnalisandoResultados)


Exercícios

1. Crie um arquivo .robot com uma tarefa chamada "Minha Primeira Tarefa" e adicione as seguintes keywords:
   - Log To Console: "Esta mensagem aparecerá no console"

Resposta no documento :doc:`respostas/01-Exercicio01.robot`


2. Pesquisa na documentação de keywords da biblioteca padrão  e adicione a keyword "sleep" para fazer o teste esperar por 2 segundos antes de exibir a mensagem no console.
Link da documentção dos keyworkd <https://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Sleep>


Resposta no documento :doc:`respostas/01-Exercicio02.robot`

