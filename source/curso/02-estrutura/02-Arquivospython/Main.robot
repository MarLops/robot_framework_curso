*** Settings ***
Library    keywordspython.py
Library    Collections

*** Test Cases ***
Call Python Keyword
	${response}=    Pegar pokemon    name_or_id=20
    ${nome}=    Get From Dictionary    ${response}    name
    Log To Console    ${nome}


