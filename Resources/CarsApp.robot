*** Settings ***
Resource  ../Resources/PO/SignInCars.robot

#Keywordlar buarya koyduk
*** Keywords ***
Navigate to Sign In Page
    SignInCars.Navigate To

Attempt Login
    [Arguments]  ${Credentials}
    SignInCars.Enter Credentials  ${Credentials}
    SignInCars.Click Submit
    Sleep  1s

Verify Login Page Error Message
    [Arguments]  ${ExpectedErrorMessage}
    SignInCars.Verify Error Message  ${ExpectedErrorMessage}