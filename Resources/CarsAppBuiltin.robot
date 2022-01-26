*** Settings ***
Resource  ../Resources/PO/SignInBuiltin.robot

*** Keywords ***
Test Multiple Login Scenarios
    [Arguments]  ${Credentials}
    Navigate to Sign In Page
    Attempt Login  ${Credentials}
    Verify Login Page Error Message  ${Credentials.ExpectedErrorMessage}

Navigate to Sign In Page
    SignInBuiltin.Navigate To

Attempt Login
    [Arguments]  ${Credentials}
    SignInBuiltin.Enter Credentials  ${Credentials}
    SignInBuiltin.Click Submit
    Sleep  1s

Verify Login Page Error Message
    [Arguments]  ${ExpectedErrorMessage}
    SignInBuiltin.Verify Error Message  ${ExpectedErrorMessage}