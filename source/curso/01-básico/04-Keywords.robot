*** Settings ***
Library    String


*** Keywords ***
Validar Credenciais
    [Documentation]    Valida usuário e senha.
    [Arguments]    ${usuario}    ${senha}
    Run Keyword If    ${usuario} == 'admin'    Log    Acesso permitido
    ...    ELSE    Log To Console    Usuário inválido
    Run Keyword If    ${senha} == 'admin'    Log    Acesso permitido
    ...    ELSE    Log To Console    Usuário inválido


Processar Dados
    [Documentation]    Processa os dados de entrada e gera um relatório.
    [Arguments]        ${arquivo}
    Log To Console    Processando ${arquivo}

Transformar Upper
    [Documentation]   Converter tudo para uppercase
    [Arguments]    ${texto}
    ${texto_novo}=    Convert To Upper Case    ${texto}
    RETURN  ${texto_novo}


*** Test Cases ***
Validar varias credencias
    Validar Credenciais    usuario='test'    senha='test'
    Validar Credenciais    usuario='admin'    senha='test'
    Validar Credenciais    usuario='admin'    senha='admin'
    Processar Dados    'arquivo_test'
    ${text}=    Transformar Upper    texto='admin'
    Log To Console    ${text}
