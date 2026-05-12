Settings no Robot Framework
=========================

02-Settings
----

Conforme explicado no tutorial anterior, a seção **Task** é onde definimos as keywords que serão executadas. 
No entanto, algumas keywords dependem de bibliotecas externas para funcionar. É aqui que entra a seção **Settings**.
O código abaixo mostra um exemplo de seção **Settings** em um arquivo ``.robot``:

Exemplo:

.. code-block:: robotframework

    *** Settings ***
    Library    OperatingSystem


Neste exemplo, a keyword ``Library`` é usada para importar a biblioteca ``OperatingSystem``, semelhante 
ao comando 'import' em Python. A biblioteca OperationSystem fornece keywords para manipular arquivos/pastas e outras funcionalidades
Segue o link para ver as keywords disponíveis na biblioteca OperatingSystem: https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html

Além de importar bibliotecas, a seção permitir adicionar documentação e metadados (segue o exemplo)

.. code-block:: robotframework

    *** Settings ***
    Documentation    Este é um arquivo de teste para demonstrar a seção Settings
    Library    OperatingSystem
    Metadata   Autor    Guilherme


O keyword ``Documentation`` é usada para adicionar uma descrição ao arquivo, enquanto  ``Metadata`` permite adicionar informações adicionais, como o autor do teste.

Algumas bibliotecas não são disponíveis por padrão e precisam ser instaladas manualmente. 
Um exemplo é a biblioteca RequestsLibrary que fornece keywords para fazer requisições HTTP (utiliza a biblioteca requests do python).

Para instalar a biblioteca, basta usar o comando 

.. code-block:: bash

    pip install robotframework-requests




O arquivo :download:`02-Settings.robot <02-Settings.robot>` possui a seção **Settings**  importando a biblioteca ``OperatingSystem`` e a RequestsLibrary.
Utilizando as keywords dispobinilizadas em ambas, será construido duas tarefas: Lista o número de documentos atuais e fazer uma requisição GET na página da google e logar o status
Dica: podemos subtituir o Set Variable por = para atribuir o valor a uma variável
Observação: a biblioteca OperationSystem disponibiliza algumas variaveis como ${CURDIR} que retorna o caminho do diretório atual, e a RequestsLibrary retorna um objeto de resposta com o status da requisição acessível através do atributo 'status_code'


exercícios

1. Utilizando a biblioteca OperatingSystem e a lista de keywords disponível (), crie uma tarefa que criara uma pasta e crie um arquivo .txt dentro desta pasta

2. Utilizando a biblioteca RequestsLibrary, crie uma tarefa que faça uma requisição GET no link https://pokeapi.co/api/v2/pokemon/1 e salve o resultado em formato json