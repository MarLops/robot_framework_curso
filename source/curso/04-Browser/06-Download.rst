===========================================
Download de Arquivos no Robot Framework
===========================================


Downloads de arquivos são extremamente comuns em projetos de RPA.

Exemplos reais:

- baixar relatórios Excel
- exportar PDFs
- notas fiscais
- XMLs
- comprovantes
- arquivos CSV
- relatórios SAP
- dashboards financeiros

No Robot Framework, utilizando a Browser Library, é possível:

- capturar downloads
- esperar conclusão
- salvar em pasta específica
- alterar nome do arquivo
- validar se o download ocorreu

----------------------------------------
O que é Context no Browser Library
----------------------------------------

A Browser Library utiliza Playwright internamente.

O conceito de:

.. code-block:: robot

    New Context

representa uma sessão isolada do navegador.

O Context controla:

- cookies
- autenticação
- permissões
- downloads
- cache
- sessão do usuário

Muito parecido com abrir uma janela anônima do navegador.

----------------------------------------
Por que downloads usam Context
----------------------------------------

O Playwright precisa habilitar permissões especiais para downloads.

Por isso usamos:

.. code-block:: robot

    New Context
    ...    acceptDownloads=True

Sem isso:

- alguns downloads podem falhar
- Browser Library pode não capturar o arquivo
- Save Download pode não funcionar

----------------------------------------
Exemplo básico
----------------------------------------

.. code-block:: robot

    *** Settings ***
    Library    Browser

    *** Test Cases ***
    Download simples

        New Browser    chromium

        New Context
        ...    acceptDownloads=True

        New Page    https://site.com

----------------------------------------
Promise To Wait For Download
----------------------------------------

Essa keyword prepara o Browser para capturar o próximo download.

Exemplo:

.. code-block:: robot

    ${download}=    Promise To Wait For Download

----------------------------------------
Executando o clique
----------------------------------------

Depois:

.. code-block:: robot

    Click    text=Baixar Relatório

----------------------------------------
Esperando download finalizar
----------------------------------------

Agora esperamos o arquivo terminar:

.. code-block:: robot

    ${arquivo}=    Wait For    ${download}

Nesse momento:

- download terminou
- Browser possui referência do arquivo
- podemos salvar em qualquer lugar

----------------------------------------
Alterando nome do arquivo
----------------------------------------

Muito importante em RPA.

Exemplo:

.. code-block:: robot

    Save Download
    ...    ${arquivo}
    ...    C:/RPA/relatorios/financeiro.xlsx

Mesmo que o site baixe:

.. code-block:: text

    report_92837.xlsx

o arquivo será salvo como:

.. code-block:: text

    financeiro.xlsx


----------------------------------------
Definindo pasta de download
----------------------------------------

Também é possível configurar:

.. code-block:: robot

    downloadsPath

Exemplo:

.. code-block:: robot

    New Context
    ...    acceptDownloads=True
    ...    downloadsPath=C:/RPA/downloads

Agora os downloads serão armazenados nessa pasta.


----------------------------------------
Validando arquivo
----------------------------------------

Após salvar:

.. code-block:: robot

    File Should Exist
    ...    C:/RPA/downloads/relatorio.xlsx

Muito importante em automações corporativas.

----------------------------------------
Esperar arquivo existir
----------------------------------------

Alguns downloads podem demorar.

Exemplo:

.. code-block:: robot

    Wait Until Created
    ...    C:/RPA/downloads/relatorio.xlsx
    ...    30s

----------------------------------------
Downloads de PDF
----------------------------------------

Muito comum em:

- boletos
- contratos
- comprovantes
- notas fiscais

Exemplo:

.. code-block:: robot

    Save Download
    ...    ${arquivo}
    ...    C:/RPA/pdf/comprovante.pdf

