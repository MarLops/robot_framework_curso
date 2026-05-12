
*** Variables ***
[Documentation]    Variáveis globais para todo o teste
${VAR_GLOBAL}    Valor Global
@{LISTA_GLOBAL}    item1    item2    item3
&{DICIONARIO_GLOBAL}    chave1=valor1    chave2=valor2

*** Test Cases ***
Exemplos de Variáveis
    ${var_local}    Set Variable    Valor Local
    @{lista_local}    Create List    a    b    c
    &{dicionario_local}    Create Dictionary    x=1    y=2
    Log To Console    Global: ${VAR_GLOBAL}
    Log To Console    Local: ${var_local}
    Log To Console    Lista Global: @{LISTA_GLOBAL}
    Log To Console    Lista Local: @{lista_local}
    Log To Console    Dicionário Global: &{DICIONARIO_GLOBAL}
    Log To Console    Dicionário Local: &{dicionario_local}
    Log To Console    Variavel Global %{OS}
