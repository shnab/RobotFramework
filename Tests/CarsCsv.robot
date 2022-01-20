*** Settings ***
Documentation  Demonstrate a need for data-driven testing
Resource  ../Data/InputDataCsv.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/CarsAppCSV.robot
Resource  ../Resources/DataManagerCsv.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results tests/CarsCsv.robot

*** Variables ***

*** Test Cases ***
Should see correct error messages with invalid logins
    ${InvalidLoginScenarios} =  DataManagerCsv.Get CSV Data    ${INVALID_CREDENTIALS_PATH_CSV}
    CarsAppCSV.Login with Many Invalid Credentials  ${InvalidLoginScenarios}
