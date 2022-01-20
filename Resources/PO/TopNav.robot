*** Settings ***
Documentation    Amazon top navigation
Library    SeleniumLibrary

*** Variables ***
${TOPNAV_REGISTER_LINK} =  Register
${TOPNAV_LOGIN_LINK} =  Log in


*** Keywords ***
Search for Products
    Enter Search Term
    Submit Search

Enter Search Term
    input text    id=twotabsearchtextbox    Ferrari 458

Submit Search
    click button    css=#nav-search-submit-button

Verify Page Loaded
    element text should be   ${TOPNAV_HEADING}  Register.

Click Registration Link
    Click Link  ${TOPNAV_REGISTER_LINK}

Click Login Link
    Click Link  ${TOPNAV_LOGIN_LINK}