*** Settings ***
Library    Browser
Library    OperatingSystem


*** Keywords ***
Salvando pagina
    [Arguments]    ${arquivo}
    ${html}=    Get Page Source
    Create Directory    amazon_htmls
    Create File    amazon_htmls${/}${arquivo}    ${html}

Clicando na proxima página
    FOR    ${i}    IN RANGE    4
        Scroll By    vertical=25%
        Sleep    time_=1 seconds
    END
    Click    xpath=//a[contains(@class,'s-pagination-next')]
    Wait For Load State
    Sleep    time_=1 seconds

Total de paginas
    ${pagina}=    Get Text   xpath=//span[contains(@class,'s-pagination-ellipsis')]/following-sibling::span[1]
    RETURN    ${pagina}

Pesquisar por produto
    [Arguments]    ${produto}
    Fill Text    xpath=//input[@id='twotabsearchtextbox']    txt=${produto}
    Click    xpath=//input[@id='nav-search-submit-button']
    Wait For Load State
        FOR    ${i}     IN RANGE    4
            Scroll By    vertical=25%
            Sleep    time_=1 seconds
    END
    

*** Test Cases ***
Navegando na amazon
    New Browser    chromium    headless=False 
    New Page    https://www.amazon.com/
    Wait For Load State
    Pesquisar por produto    produto=laptop
    ${numero_pagina}=    Total de paginas
    ${pagina_atual}=    Set Variable    1
    Salvando pagina    amazon_laptop_${pagina_atual}
    FOR    ${index}    IN RANGE    2  ${numero_pagina}    
        Clicando na proxima página
        Log To Console    ${index}
        Salvando pagina    arquivo=amazon_laptop_${index}
    END
    Close Browser