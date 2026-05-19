*** Settings ***
Documentation     Example suite showing tags and timeout in settings, keywords, and test cases
Test Tags       regression
Test Timeout      1 minute
Metadata    autor    guilherme
Metadata    tipo    curso

*** Test Cases ***
Tagged Test Case
    [Tags]    critical    web
    [Timeout]    30 seconds
    Keyword With Tags
    Log    Running a test case with tags and timeout

Another Tagged Case
    [Tags]    fast    ui
    Log    This test uses tags defined in test cases

*** Keywords ***
Keyword With Tags
    [Tags]    keywordtag
    [Timeout]    15 seconds
    Log    Executing keyword with its own tag and timeout
