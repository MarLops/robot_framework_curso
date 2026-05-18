*** Settings ***
Library    Collections
Library    PokeClient.py    10    



*** Test Cases ***
Get pokemos
    ${dict}=    Get Pokemon    name_or_id=15
    ${name}=     Get From Dictionary    ${dict}    name
    Log To Console    ${name}


Get my pokemon
    ${dict}=    Get My Pokemon
    ${name}=     Get From Dictionary    ${dict}    name
    Log To Console    ${name}