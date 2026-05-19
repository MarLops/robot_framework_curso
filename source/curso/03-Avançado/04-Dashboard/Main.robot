*** Settings ***
Documentation    Dashboard Test Suite with multiple tags for robot-dashboard

*** Test Cases ***
Test Case 01 - Log To Consolein Success
    [Tags]    smoke    authentication    critical
    Log To Console    Test autentificao 
    Log To Console    Test 1

Test Case 02 - User Creation
    [Tags]    regression    user-management
    Log To Console    Beginning user creation process    
    Log To Console    Validating user input    
    Log To Console    User created successfully    

Test Case 03 - Dashboard Load
    [Tags]    smoke    performance    critical
    Log To Console    Loading dashboard    


Test Case 04 - Data Export
    [Tags]    regression    integration    critical
    Log To Console    Starting data export    


Test Case 05 - System Health Check
    [Tags]    smoke    sanity    performance
    Log To Console    Checking system health    

