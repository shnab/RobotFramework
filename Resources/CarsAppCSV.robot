*** Settings ***
Resource  ../Resources/PO/SignInCarsCsv.robot

*** Keywords ***
Login with Many Invalid Credentials
    [Arguments]  ${InvalidLoginScenarios}
    FOR  ${LoginScenario}  IN  @{InvalidLoginScenarios}
      run keyword and continue on failure  SignInCarsCsv.Navigate To
      run keyword and continue on failure  Attempt Login  ${LoginScenario}
      run keyword and continue on failure  Verify Login Page Error Message  ${LoginScenario}
    END

Navigate to Sign In Page
    SignInCarsCsv.Navigate To

Attempt Login
    [Arguments]  ${Credentials}
    SignInCarsCsv.Enter Credentials  ${Credentials}
    SignInCarsCsv.Click Submit
    Sleep  1s

Verify Login Page Error Message
    [Arguments]  ${ExpectedErrorMessage}
    SignInCarsCsv.Verify Error Message  ${ExpectedErrorMessage}