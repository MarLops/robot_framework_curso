*** Settings ***
Library    Browser


*** Keywords ***
Carrega toda pagina
    WHILE    True
        Scroll To Element    text=Load More
        Sleep    time_=2 seconds
        Click    text=Load More
        Wait For Load State
        ${exists}=    Run Keyword And Return Status    Wait For Elements State    text=Load More    visible    2s
        IF    not ${exists}
            Scroll By    vertical=100%
            Sleep    time_=2 seconds
            BREAK
        END
        
    END

*** Test Cases ***
Carregando a pagina
    New Browser    browser=chromium    headless=false
    New Page    https://www.web-scraping.dev/reviews
    Wait For Load State
    Wait For Elements State    text=Load More    visible
    Carrega toda pagina
    Close Browser