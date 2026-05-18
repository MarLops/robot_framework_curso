
*** Keywords ***
Par Ou Impar
    [Arguments]    ${numero}
    ${resultado}=    Evaluate    ${numero} // 2
    IF    ${resultado} == 0
        Log To Console    "par"
    ELSE
        Log To Console    "impar"
    END 


*** Test Cases ***
Verificar Numero Par Impar
    Par Ou Impar    3
    Par Ou Impar    4