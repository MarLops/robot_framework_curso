===========================================
Múltiplas Páginas no Browser Library
===========================================



Em automações RPA modernas, muitas vezes é necessário trabalhar com múltiplas páginas ao mesmo tempo.

Exemplos reais:

- copiar dados entre sistemas
- comparar informações
- abrir dashboards diferentes
- consultar ERP e atualizar CRM
- acessar dois sites simultaneamente
- scraping distribuído
- login em múltiplos portais

A Browser Library permite:

- abrir várias páginas
- alternar entre páginas
- manter sessões separadas
- trabalhar com múltiplas abas

----------------------------------------
Criando múltiplas páginas
----------------------------------------

A keyword:

.. code-block:: robot

    New Page

cria uma nova página no navegador.

----------------------------------------
Exemplo simples
----------------------------------------

.. code-block:: robot

    New Page    https://google.com

    New Page    https://github.com

Agora existem duas páginas abertas.

----------------------------------------
Problema comum
----------------------------------------

Após abrir várias páginas, precisamos:

- trocar página atual
- voltar para outra página
- controlar abas
- obter informações específicas

Para isso usamos:

.. code-block:: robot

    Switch Page

----------------------------------------
Obtendo IDs das páginas
----------------------------------------

A keyword:

.. code-block:: robot

    Get Page Ids

retorna todas as páginas abertas.

Exemplo:

.. code-block:: robot

    ${pages}=    Get Page Ids

----------------------------------------
Criando duas páginas
----------------------------------------

Exemplo:

.. code-block:: robot

    *** Settings ***
    Library    Browser

    *** Test Cases ***
    Multiplas paginas

        New Browser    chromium

        ${pagina1}=    New Page
        ...    https://google.com

        ${pagina2}=    New Page
        ...    https://github.com

----------------------------------------
Alternando entre páginas
----------------------------------------

Agora podemos trocar de página:

.. code-block:: robot

    Switch Page    ${pagina1}

----------------------------------------

Depois:

.. code-block:: robot

    Switch Page    ${pagina2}

----------------------------------------
Exemplo completo
----------------------------------------

.. code-block:: robot

    *** Settings ***
    Library    Browser

    *** Test Cases ***
    Trabalhar com duas paginas

        New Browser    chromium

        ${google}=    New Page
        ...    https://google.com

        ${github}=    New Page
        ...    https://github.com

        Switch Page    ${google}

        Wait For Load State

        ${titulo_google}=    Get Title

        Log    ${titulo_google}

        Switch Page    ${github}

        Wait For Load State

        ${titulo_github}=    Get Title

        Log    ${titulo_github}


