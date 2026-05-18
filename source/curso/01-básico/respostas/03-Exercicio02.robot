*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem

*** Test Cases ***
Get Pokemon 1 JSON
    ${response}=    GET    https://pokeapi.co/api/v2/pokemon/1
    Should Be Equal As Integers    ${response.status_code}    200
    ${dict}=    Set Variable    ${response.json()}
    Create File    path=pokemon1.json    content=${dict}

