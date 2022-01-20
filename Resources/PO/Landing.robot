*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LANDING_TEXT} =  Welcome!
${LANDING_LINK} =    id=nav-your-amazon

*** Keywords ***
Navigate To
#${URL.${ENVIRONMENT}} ==> URL liste, onun icinden environmet=dev or qa cagiriyoruz.
    Go To  ${URL.${ENVIRONMENT}}

Verify Page Loaded
#    wait until page contains  ${LANDING_TEXT}
#    element text should be    ${LANDING_TEXT}    Welcome!
    wait until page contains element    ${LANDING_LINK}