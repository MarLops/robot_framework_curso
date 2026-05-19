*** Settings ***
Library    Collections


*** Test Cases ***
Log To Console
    Log Message With Listener

*** Keywords ***
Log Message With Listener
    Log To Console    Mensagem enviada para o console via keyword
