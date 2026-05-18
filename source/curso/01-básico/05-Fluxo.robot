*** Test Cases ***
Verificando se é 5
    ${value}=    Set Variable    5
    IF    ${value} > 5
        Log To Console    'Valor acima de 5'
    ELIF    ${value} == 5
        Log To Console    'Valor igual 5'
    ELSE
        Log To Console    'Valor menor que 5'
    END

Verificando limite de usuario
    ${numero_usuario}=    Set Variable    11
    IF  ${numero_usuario}>10
        Log To Console    'Atingiu o limite'
    ELSE
        Log To Console    'Ainda podemos adicionar usuarios'
    END


Mostrando todos os numeros ate 4
    FOR    ${i}    IN   RANGE    4
        Log To Console    Iteration ${i}
    END


Mostrando todos os numeros até menor 10 e mas para no 7 
    ${contagem}=    Set Variable    2
    WHILE    ${contagem}<10
        Log To Console     ${contagem}
        ${contagem}=    Evaluate        ${contagem} + 1
        IF    ${contagem}==7
            BREAK
        END
    END

Fazendo operação errada
    ${contagem}=    Set Variable    1
    TRY
        ${contagem}=    ${contagem}+1
    EXCEPT    AS    ${error}
        Log    Error: ${error}
    END