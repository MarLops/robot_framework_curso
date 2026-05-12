*** Settings ***
Library    OperatingSystem
Library    RequestsLibrary


*** Tasks ***
Lista numeros de documentos
    ${numero_documentos}=    Count Files In Directory    ${CURDIR}
    Log To Console    Existe ${numero_documentos} documentos na pasta ${CURDIR}
 

Fazer requisição para google
    ${resposta}=    GET    https://www.google.com
    Log To Console   ${resposta.status_code}
