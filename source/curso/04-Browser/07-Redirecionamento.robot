*** Settings ***
Library    Browser
Library    Collections

*** Test Cases ***
Login
    New Browser    chromium     headless=false
    New Page    https://www.web-scraping.dev/login
    Wait For Load State
    Click    text=Auth Credentials
    Wait For Load State
    ${tds}=    Get Elements    xpath=//td
    ${user}=    Get Text    ${tds}[1]
    ${password}=    Get Text    ${tds}[2]
    Go Back
    Wait For Load State
    Fill Text    xpath=//input[@name='username']    ${user}
    Fill Text    xpath=//input[@name='password']    ${password}
    Click    xpath=//button[@type='submit']
    Sleep    time_=2 seconds
