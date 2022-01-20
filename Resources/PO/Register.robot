*** Settings ***
Library  SeleniumLibrary

*** Variables ***
#buraya locatorlari koyuyoruz.
${REGISTER_EMAIL_INPUT} =       id=MainContent_Email
${REGISTER_PASSWORD1_INPUT} =   id=MainContent_Password
${REGISTER_PASSWORD2_INPUT} =   id=MainContent_ConfirmPassword

*** Keywords ***
Verify Page Loaded
    wait until page contains element  ${REGISTER_EMAIL_INPUT}


#               ASAMALAR
#1. IMB_Test.robot sayfasinda==> &{CUSTOMER_USER} icinde bir dictionary create ettik
#2. IMB_Test.robot sayfasinda==> ImbApp.Create New Account  ${CUSTOMER_USER} declare ettik
#3. ${CUSTOMER_USER} icindeki datayi Bu sayfadaki(ImbApp.robot) Register.Fill Page and Submit  ${UserData} icerisine Arguments yaptik
#4. [Arguments]  ${UserData}    ==> Register.Fill Page and Submit  ${UserData} ile ayni yere tekabul eder.
#5. Register.robot sayfasinda .(nokta) ile ${UserData} icindeki dolayisiyla da ${CUSTOMER_USER} icindeki elementleri cagirdik.
    #Fill Email  ${UserData.Email}
    #Fill Password  ${UserData.Password} olarak kulladik
#6. Fill Email bu sayfada declare errigimiz bir keyword.
    #    [Arguments]  ${Email}
    #    Input Text  ${REGISTER_EMAIL_INPUT}  ${Email} ==> buradaki ${UserData.Email} ile ayni oluyor.
    #        **** Burada guzel bir dongu var. Tekrar kullanilabilirlik acisindan en

Fill Page and Submit
    [Arguments]  ${UserData}
    Fill Email  ${UserData.Email}
    Fill Password  ${UserData.Password}
    Fill Confirmation Password  ${UserData.Password}
    #TODO - Submit the form
    Sleep  5s
#Fill Page and Submit
#    [Arguments]  ${Email} ${Password}
#    Fill Email  ${Email}
#    Fill Password  ${Password}
#    Sleep  5s

Fill Email
    [Arguments]  ${Email}
    Input Text  ${REGISTER_EMAIL_INPUT}  ${Email}

Fill Password
    [Arguments]  ${Password}
    Input Text  ${REGISTER_PASSWORD1_INPUT}  ${Password}

Fill Confirmation Password
    [Arguments]  ${Password}
    Input Text  ${REGISTER_PASSWORD2_INPUT}  ${Password}