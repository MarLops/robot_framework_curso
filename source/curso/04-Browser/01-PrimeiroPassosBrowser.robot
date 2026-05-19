*** Settings ***
Documentation    Robo para acessar site da Amazon
Library    Browser

*** Test Cases ***
Abrindo Amazon
    New Browser    chromium    headless=False 
    New Page    https://www.amazon.com/
    Sleep   10s
    Close Browser