Keyword
=======

Nesta seção explicamos como criar Keywords em Robot Framework usando `Documentation` e `Arguments`.

Documentation
-------------

Cada Keyword pode ter uma documentação que descreve o propósito da Keyword e seus parâmetros.
Isso é feito com a palavra-chave `Documentation` dentro da tabela de Keywords.

Exemplo:

.. code-block:: robotframework

    *** Keywords ***
    Processar Dados
        [Documentation]    Processa os dados de entrada e gera um relatório.
        [Arguments]        ${arquivo}
        Log To Console    Processando ${arquivo}

Arguments
---------

Use `[Arguments]` para listar os parâmetros que a Keyword aceita. 
Uma diferença entre keywords e Test é a possibilidade de colocar argumentos. 

Exemplo:

.. code-block:: robotframework

    *** Keywords ***
    Validar Credenciais
        [Documentation]    Valida usuário e senha.
        [Arguments]    ${usuario}    ${senha}
        Run Keyword If    '${usuario}' == 'admin'    Log    Acesso permitido
        ...    ELSE    Fail    Usuário inválido

Retornar valor
-----

Semelhante a uma função python, a keyword também pode retornar valor para ser utilizado durante o teste

Exemplo:

.. code-block:: robotframework

    *** Keywords ***
    Transformar Upper
        [Documentation]   Pegar primeira letra e transformar em uppercaose
        [Arguments]    ${texto}
        ${texto_novo}=    Uppercase First Letter    ${texto}
        RETURN  ${texto_novo}



É possível retornar mais de um argumento , como é feito no python


Notas
----------------
- Use `Documentation` para descrever cada Keyword.
- Use `Arguments` para definir os parâmetros da Keyword.



exercícios
------------------------


1-  Criar um keyword que recebe um numero e faça uma requisição no site pokeapi (https://pokeapi.co/api/v2/pokemon/{Numero}) e retorna o valor

