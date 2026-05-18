*** Settings ***
Suite Setup    Suite Setup Keyword
Suite Teardown    Suite Teardown Keyword
Test Setup    Test Setup Keyword
Test Teardown    Test Teardown Keyword



*** Keywords ***
Suite Setup Keyword
	Log to Console    Suite Setup executed

Suite Teardown Keyword
	Log to Console    Suite Teardown executed

Test Setup Keyword
	Log to Console    Test Setup executed

Test Teardown Keyword
	Log to Console    Test Teardown executed


*** Test Cases ***
Example Test - 1
	Log to Console    Running example test


Example Test - 2
	Log to Console    Running example test 2
    Log To Console    Running again