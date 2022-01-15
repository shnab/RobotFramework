*** Settings ***
Library    OperatingSystem

*** Variables ***

*** Test Cases ***
Test Case 1
    [Tags]    foo
    log    I am a test case 1 of Web feature 1
Test Case 2
    [Tags]    bar
    log    I am a test case 2 of Web feature 1
    directory should exit    c:\\fake\\

*** Keywords ***