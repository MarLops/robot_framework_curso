*** Settings ***
Library    RequestsLibrary


*** Keywords ***
Buscar Pokemon Por Numero
    [Arguments]    ${numero}
    ${response}=   GET   https://pokeapi.co/api/v2/pokemon/${numero}
    Should Be Equal As Integers    ${response.status_code}    200
    RETURN  ${response.json()}




*** Test Cases ***
Pegar pokemon 100
    ${data}=    Buscar Pokemon Por Numero    100
    Log To Console    ${data}
