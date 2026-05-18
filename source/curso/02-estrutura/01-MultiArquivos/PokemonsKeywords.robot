*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Keywords ***
Pegar_pokemon
    [Arguments]    ${Numero_pokemon}
    ${pokemon}=    GET   https://pokeapi.co/api/v2/pokemon/${Numero_pokemon}
    IF    ${pokemon.status_code}==200
        Dictionary Should Contain Key    ${pokemon.json()}    name
        ${name}=     Get From Dictionary    ${pokemon.json()}    name
        RETURN    ${name}  
    ELSE
        Fail    "dont have pokemon"
    END
