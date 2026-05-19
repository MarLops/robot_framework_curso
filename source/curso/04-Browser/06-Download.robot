*** Settings ***
Library    Browser
Library    OperatingSystem


*** Keywords ***
Baixar arquivos
    [Arguments]    ${novo_arquivo}
    ${download}=    Promise To Wait For Download
    Click    xpath=//button[contains(text(),'Download File')]
    ${arquivo}=    Wait For    ${download}
    ${origem}=    Set Variable    ${arquivo}[saveAs]
    Move File    ${origem}    ${novo_arquivo}
    Wait Until Created    ${novo_arquivo}    30s

*** Test Cases ***
Main
    New Browser    chromium     headless=false
    New Context    acceptDownloads=True
    New Page    https://www.web-scraping.dev/file-download
    Baixar arquivos    novo_arquivo=arquivo_1.pdf
    Baixar arquivos    novo_arquivo=arquivo_2.pdf