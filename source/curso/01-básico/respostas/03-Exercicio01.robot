*** Settings ***
Library    OperatingSystem

*** Tasks ***
Criar pasta e arquivo
    Create Directory    pasta_teste
    Create File    pasta_teste${/}arquivo.txt
    File Should Exist    pasta_teste${/}arquivo.txt
