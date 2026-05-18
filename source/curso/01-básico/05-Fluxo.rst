Fluxo 
===============================

Nesta seção , iremos discutir como controlar o fluxo do robo, utilizando IF ELSE e outras palavras. 

IF ELSE
-------

Como qualquer linguagem de programação, o IF ELSE roda dependendo de alguma condição satisfeita

Examplo:

.. code-block:: robotframework

    *** Test Cases ***
    If  ${usuario}='admin'
            Log    'É administrador'
        ELSE
            Log    'Não é administrador'
    END

Uma das grandes diferenças com o python, é necessário terminar usando END

Um outro exemplo

Examplo:

.. code-block:: robotframework

    *** Test Cases ***
    If  ${numero_usuario}>10
            Log    'Atingiu o limite'
        ELSE
            Log    'Ainda podemos adicionar usuarios'
    END


IF ELIF ELSE
------------

Uma forma de extender o IF-ELSE, temos o IF-ELIF-ELSE para permitir fluxos mais complexos

Example:

.. code-block:: robotframework

    *** Test Cases ***

    ${value}=    Set Variable    5
    IF    ${value} > 5
        Log    'Valor acima de 5'
    ELIF    ${value} == 5
        Log    'Valor igual 5'
    ELSE
        Log    'Valor menor que 5'
    END



Loop
----------------

O robot oferece duas formas de fazer loop: FOR e WHILE. O primeiro deve receber um objeto interavel , enquanto o segundo 
fica em loop até a condição for valida.


A seguir, temos um exemplo simples . No seguinte, utilizando RANGE que cria uma lista com os numeros

Exemplo:

.. code-block:: robotframework

    *** Test Cases ***

    FOR    ${i}    IN   [1,2,3]
        Log    Iteration ${i}
    END


Exemplo:

.. code-block:: robotframework

    *** Test Cases ***

    FOR    ${i}    IN   RANGE 5
        Log    Iteration ${i}
    END



WHILE BREAK
-----------

Diferente do FOR, o while continua até a condição não for satisfeita

Exemplo:

.. code-block:: robotframework

    *** Test Cases ***
    ${contagem}=    Set Variable    1
    While ${contagem} < 10
        Log     ${contagem}
        ${contagem}=    Set Variable    ${contagem + 1}
    END


Semelhante do FOR, é necessário utilizar END no final .
Além da condição, podemos usar BREAK



Exemplo:

.. code-block:: robotframework

    *** Test Cases ***
    ${contagem}=    Set Variable    1
    While ${contagem} < 10
        Log     ${contagem}
        ${contagem}=    Evaluate    ${contagem} + 1        
        IF    ${contagem}==2
            BREAK
        END
    END

OBS: o Evaluate permite executar operações python como soma 

TRY EXCEPT
------------------------

O último keyword que permiti controlar o fluxo é o TRY EXCEPT.
Esse permite detectar erro no código e tratar.

Exemplo:

.. code-block:: robotframework

    *** Test Cases ***
    ${contagem}=    Set Variable    1
    TRY
        ${contagem}=    ${contagem}+1
    EXCEPT    AS    ${error}
        Log    Error: ${error}
    END



exercicio 
------------------------------

1- Crie uma keyword que recebe um numero e verifica se esse numero é par ou impar e log em casa um dos casos uma mensagem diferente
OBS: usa Evaluate para pegar o resultado da divisao
