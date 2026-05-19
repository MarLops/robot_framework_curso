===========================================
Go Back, Go Forward e Verificação de URL
===========================================



Em automações RPA com Robot Framework, é muito comum navegar entre páginas.

Exemplos reais:

- abrir detalhes de produtos
- voltar para listagens
- navegar entre páginas
- validar redirecionamentos
- confirmar login
- verificar páginas de erro
- navegar em fluxos corporativos

A Browser Library fornece keywords importantes para isso:

- :code:`Go Back`
- :code:`Go Forward`
- :code:`Get Url`
- :code:`Wait For Load State`


----------------------------------------
Go Back
----------------------------------------

A keyword:

.. code-block:: robot

    Go Back

faz o navegador retornar para a página anterior.

Muito parecido com clicar no botão "Voltar" do navegador.

----------------------------------------
Exemplo básico
----------------------------------------

.. code-block:: robot

    *** Settings ***
    Library    Browser

    *** Test Cases ***
    Voltar página

        New Page    https://site.com

        Click    text=Detalhes

        Wait For Load State

        Go Back

        Wait For Load State


----------------------------------------
Go Forward
----------------------------------------

Depois de usar:

.. code-block:: robot

    Go Back

é possível avançar novamente usando:

.. code-block:: robot

    Go Forward

Muito parecido com o botão "Avançar" do navegador.

----------------------------------------
Exemplo
----------------------------------------

.. code-block:: robot

    Click    text=Detalhes

    Wait For Load State

    Go Back

    Wait For Load State

    Go Forward

    Wait For Load State

----------------------------------------
Get Url
----------------------------------------

A keyword:

.. code-block:: robot

    Get Url

retorna a URL atual da página.

Muito importante para validar redirecionamentos.

----------------------------------------
Exemplo
----------------------------------------

.. code-block:: robot

    ${url}=    Get Url

    Log    ${url}

----------------------------------------
Sites SPA
----------------------------------------

Aplicações modernas:

- React
- Angular
- Vue

podem atualizar a URL sem reload completo.

Por isso é importante usar:

.. code-block:: robot

    Wait For Load State

ou:

.. code-block:: robot

    Wait For Elements State

----------------------------------------
Go To
----------------------------------------

Às vezes é melhor navegar diretamente.

Exemplo:

.. code-block:: robot

    Go To    https://site.com/dashboard

Muito usado quando:

- histórico falha
- SPA quebra Go Back
- redirect inconsistente

