===========================================
Scroll e Wait For Elements State no RPA
===========================================

Introdução
===========

Em automações RPA com Robot Framework, muitos sites modernos carregam conteúdo dinamicamente.

Isso acontece principalmente em:

- Infinite scroll
- Botões "Load More"
- Paginação dinâmica
- E-commerces
- Redes sociais
- Dashboards
- Sistemas SPA (Single Page Application)

Nesses cenários, o HTML da página é atualizado após uma ação do usuário.

O robô então precisa:

1. Esperar o novo conteúdo aparecer
2. Fazer scroll novamente
3. Localizar o novo botão
4. Continuar o processo

Esse padrão é extremamente comum em automações modernas.

----------------------------------------
Problema comum em RPA
----------------------------------------

Imagine um botão:

.. code-block:: html

    <button>
        Load More
    </button>

Ao clicar:

- novos produtos são carregados
- o HTML da página muda
- o botão anterior desaparece
- um novo botão aparece mais abaixo

O robô então precisa:

- esperar a atualização
- fazer scroll novamente
- clicar no novo botão

----------------------------------------
Wait For Elements State
----------------------------------------

A keyword:

.. code-block:: robot

    Wait For Elements State

é muito importante para RPA moderno.

Ela espera um elemento atingir um estado específico.

Exemplo:

.. code-block:: robot

    Wait For Elements State    text=Load More    visible

Estados comuns
================

+--------------+-----------------------------------+
| Estado       | Descrição                         |
+==============+===================================+
| visible      | Elemento visível                  |
+--------------+-----------------------------------+
| hidden       | Elemento escondido                |
+--------------+-----------------------------------+
| attached     | Existe no DOM                     |
+--------------+-----------------------------------+
| detached     | Removido do DOM                   |
+--------------+-----------------------------------+
| enabled      | Pode ser clicado                  |
+--------------+-----------------------------------+

----------------------------------------
Scroll no Browser Library
----------------------------------------

Muitos elementos só aparecem após scroll.

Exemplo:

.. code-block:: robot

    Scroll To Element    text=Load More

Ou:

.. code-block:: robot

    Evaluate JavaScript    window    window.scrollTo(0, document.body.scrollHeight)

Muito usado em:

- Amazon
- Mercado Livre
- Shopee
- LinkedIn
- Instagram
- Sistemas corporativos

----------------------------------------
Cenário real de Load More
----------------------------------------

Fluxo típico:

1. Página carrega produtos
2. Botão "Load More" aparece
3. Robô faz scroll
4. Robô clica
5. Novo HTML é carregado
6. Novo botão aparece
7. Processo continua

----------------------------------------
Exemplo simples
----------------------------------------

.. code-block:: robot

    *** Settings ***
    Library    Browser

    *** Test Cases ***
    Carregar mais produtos

        New Page    https://site.com/produtos

        Scroll To Element    text=Load More

        Click    text=Load More

        Wait For Elements State    text=Load More    visible

        Scroll To Element    text=Load More

        Click    text=Load More

----------------------------------------
Problema importante
----------------------------------------

Após o clique:

.. code-block:: robot

    Click    text=Load More

o HTML pode ser recriado.

Isso significa que:

- referências antigas deixam de existir
- elementos ficam stale
- o botão anterior morre
- um novo botão nasce no DOM

Por isso é importante:

- esperar novamente
- localizar novamente
- fazer scroll novamente

----------------------------------------
Exemplo robusto para RPA
----------------------------------------

.. code-block:: robot

    *** Settings ***
    Library    Browser

    *** Test Cases ***
    Scroll dinâmico

        New Page    https://site.com

        FOR    ${index}    IN RANGE    5

            Wait For Elements State
            ...    text=Load More
            ...    visible

            Scroll To Element    text=Load More

            Click    text=Load More

            Wait For Load State    networkidle

        END

----------------------------------------
Wait For Load State
----------------------------------------

Muito útil após atualizações dinâmicas.

Exemplo:

.. code-block:: robot

    Wait For Load State    networkidle

Isso espera:

- requisições AJAX terminarem
- carregamento estabilizar
- página finalizar updates

Excelente para RPA moderno.



Use waits inteligentes
=======================

Prefira:

- visible
- attached
- enabled
- networkidle

Isso deixa o robô:

- mais rápido
- mais estável
- menos frágil

