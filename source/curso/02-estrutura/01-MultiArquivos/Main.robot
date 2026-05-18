*** Settings ***
Resource    PokemonsKeywords.robot    
Resource    Variables.robot


*** Test Cases ***
Pokemon secreto
    ${nome_pokemon_secreto}=    Pegar_pokemon    Numero_pokemon=${numero_pokemon_secreto}
    Log To Console    teste