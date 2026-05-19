Interagindo com a página - Browser
--------------------

Nesta seção e nas próximos vamos construir um robo que extrai dados da amazon. 
Nesta etapa, vamos apreender a como preencher o campo de busca e salvar o resultado


Click e Fill Text
-------------------

A biblioteca possui diversos keywords , entre eles Click e Fill Text.
Conforme o nome sugere, o primeiro permite em clicar em botões , enquanto o segundo permiti
preencher campos de texto

Usando o site do amazon ,vamos pesquisar por laptops. 
O campo de busca possui o seguinte html

.. code-block:: html

    <div class="nav-search-field ">
        <label for="twotabsearchtextbox" style="display: none;">Search Amazon</label>
        <input type="text" id="twotabsearchtextbox" value="" name="field-keywords" autocomplete="off" placeholder="Search Amazon" class="nav-input nav-progressive-attribute" dir="auto" tabindex="0" aria-label="Search Amazon" role="searchbox" aria-autocomplete="list" aria-controls="sac-autocomplete-results-container" aria-expanded="true" aria-haspopup="grid" spellcheck="false">
    </div>

Observe que o elemento html possui id e placeholder. Usando xpath, podemos selecionar exatamento esse elemento e preencher um texto 

.. code-block:: robotframework

    *** Test Cases ***
    Abrindo amazon
        New Browser    chromium    headless=False 
        New Page    https://www.amazon.com/
        Wait For Load State
        Fill text   xpath=xpath=//input[@id='twotabsearchtextbox']    txt=laptop
        Sleep   2 seconds
        Close Browser

Usamos o keyword 'Wait For Load State' para esperar carregar o site
Em seguinda, utilizamos o Fill text para preencher o texto o campo de escrita.


Para executar a pesquisa, podemos somente pressionar Enter ou clicar na lupa.
Vamos fazer os dois exemplos


Pressionar Enter

.. code-block:: robotframework
    Press Keys    xpath=xpath=//input[@id='twotabsearchtextbox']    Enter


Clicando na lupa (A lupa é um input com id nav-search-submit-button)

.. code-block:: robotframework
    Click    xpath=xpath=//input[@id='nav-search-submit-button']    


Salvando html
-------------------

Para extrair dados da página, podemos salvar o html para depois extrair dados. 


.. code-block:: robotframework
    ${html}=    Get Page Source
    Create File    amazon.html    ${html}


O 'Get Page Source' extrai o html e usando 'Create File' criamos o arquivo com o conteúdo


