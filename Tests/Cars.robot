*** Settings ***
Documentation  Demonstrate a need for data-driven testing
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/CarsApp.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results tests/Cars.robot

*** Variables ***
#   ACIKLAMA
    #Aslinda InputData.robot buradaydi. Burdaki variable oraya tasidik

## Configuration
 #${BROWSER} =  edge
 #${ENVIRONMENT} =  prod
 #&{BASE_URL}  dev=https://dev.cars.com/  qa=https://qa.cars.com/  prod=https://www.cars.com/
 #${LOGIN_URL} =  profile/secure/login
 #
 ## Input Data
 #&{UNREGISTERED_USER}  Email=admin@robotframeworktutorial.com  Password=TestPassword!  ExpectedErrorMessage=You haven't signed up yet. Try a different email address or
 #&{INVALID_PASSWORD_USER}  Email=bryan@bryanlamb.com  Password=TestPassword!  ExpectedErrorMessage=Please double check your password. It should be 6 or more characters with no spaces. If you don't remember it, you can
 #&{BLANK_CREDENTIALS_USER}  Email=#BLANK  Password=#BLANK  ExpectedErrorMessage=Please enter your email address and password.

*** Test Cases ***
Unregistered user should see correct error message at login
    CarsApp.Navigate to Sign In Page
    CarsApp.Attempt Login  ${UNREGISTERED_USER}
    CarsApp.Verify Login Page Error Message  ${UNREGISTERED_USER.ExpectedErrorMessage}

Login with invalid password should show correct error message
    CarsApp.Navigate to Sign In Page
    CarsApp.Attempt Login  ${INVALID_PASSWORD_USER}
    CarsApp.Verify Login Page Error Message  ${INVALID_PASSWORD_USER.ExpectedErrorMessage}

Login with blank email and password should show correct error message
    CarsApp.Navigate to Sign In Page
    CarsApp.Attempt Login  ${BLANK_CREDENTIALS_USER}
    CarsApp.Verify Login Page Error Message  ${BLANK_CREDENTIALS_USER.ExpectedErrorMessage}