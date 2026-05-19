Primeiros passos - Browser
-------------------------


Uma das atividades mais comum no mundo da automatização é interagir com sites/app onlines, seja para extrair informações (o famoso
web scraping) ou fazer alguma operação no site (como ordernar um pedido)

Baseado no playwright, a comunidade do robot criou a biblioteca Browser. Essa biblioteca
possui um conjunto enorme de keywords que permite simular o comportamento do usuário no browser, seja ele qual for

Como instalar
-------------------------

A instalação da biblioteca é simples

.. code-block:: console

    pip install robotframework-browser
    pip install robotframework-browser[bb]


ou 

.. code-block:: console

    uv add robotframework-browser
    uv add robotframework-browser[bb]

Além da instação da biblioteca, precisamos instalar o drive que permite manipular o brower


.. code-block:: console

    python -m Browser.entry install

ou

.. code-block:: console

    uv add python -m Browser.entry install



Primeiro código
----------------------

Para iniciar o robo, precisamos abrir o browser e abrir uma página

.. code-block:: robotframework

    *** Settings ***
    Library    Browser

    *** Test Cases ***
    Abrindo amazon
        New Browser    chromium    headless=False 
        New Page    https://www.amazon.com/
        Sleep   10s
        Close Browser


A keyword 'New Browser' recebe como parâmetro o drive que deve acessar e se deve aparecer na tela 
O 'New page' abri uma página no browser, neste caso, estamos abrindo o site da amazon
Por final, rodamos o 'Sleep' e depois fechamos o browser 'Close Browser'



    