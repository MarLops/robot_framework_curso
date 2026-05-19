*** Settings ***
Library    Browser


*** Test Cases ***
Main
    New Browser    chromium     headless=false
    New Context
    ${page_login}=    New Page    https://www.web-scraping.dev/login
    Wait For Load State
    ${page_user}=    New Page    https://www.web-scraping.dev/credentials
    Wait For Load State
    Switch Page    ${page_user}
    Sleep    time_=3 seconds
    Close Page
    Switch Page    ${page_login}
    Sleep    time_=2 seconds