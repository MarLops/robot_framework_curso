*** Settings ***
Documentation    Pesquisa por produtos e salvar
Library    OperatingSystem
Library    Browser


*** Keywords ***
Pesquisar por produto
    [Arguments]    ${produto}
    Fill Text    xpath=//input[@id='twotabsearchtextbox']    txt=${produto}
    Click    xpath=//input[@id='nav-search-submit-button']
    Wait For Load State

Salvando Pagina
    ${html}=    Get Page Source
    Create File    amazon.html    ${html}


*** Test Cases ***
Pesquisando
    New Browser    chromium    headless=False 
    New Page    https://www.amazon.com/
    Wait For Load State
    Pesquisar por produto    produto=laptop
    Salvando Pagina
    Close Browser