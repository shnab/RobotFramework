*** Settings ***
Library  SeleniumLibrary
Resource  ./PO/Landing.robot
Resource  ./PO/TopNav.robot
Resource  ./PO/Register.robot

*** Keywords ***
Navigate to Landing Page
    Landing.Navigate To
    Landing.Verify Page Loaded

#               ASAMALAR
#1. IMB_Test.robot sayfasinda==> &{CUSTOMER_USER} icinde bir dictionary create ettik
#2. IMB_Test.robot sayfasinda==> ImbApp.Create New Account  ${CUSTOMER_USER} declare ettik
#3. ${CUSTOMER_USER} icindeki datayi Bu sayfadaki(ImbApp.robot) Register.Fill Page and Submit  ${UserData} icerisine Arguments yaptik
#4. [Arguments]  ${UserData}    ==> Register.Fill Page and Submit  ${UserData} ile ayni yere tekabul eder.
#5. Register.robot sayfasinda .(nokta) ile ${UserData} icindeki dolayisiyla da ${CUSTOMER_USER} icindeki elementleri cagirdik.
    #Fill Email  ${UserData.Email}
    #Fill Password  ${UserData.Password} olarak

Create New Account
    [Arguments]  ${UserData}
    TopNav.Click Registration Link
    Register.Verify Page Loaded
    Register.Fill Page and Submit  ${UserData}

Create New Account with Invalid Data
    [Arguments]  ${UserData}
    TopNav.Click Registration Link
    Register.Verify Page Loaded
    Register.Fill Email  ${UserData.Email}
    Register.Fill Password  abc