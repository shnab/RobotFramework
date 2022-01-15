*** Settings ***
Documentation    This is some basic info about the whole suite
Library    SeleniumLibrary
*** Variables ***

${BROWSER}  chrome
${URL}      http://www.amazon.com

#to run==>robot -d results tests\LocatorsHoverOver.robot
*** Test Cases ***
# robot -d results tests\Amazon.robot ==> to run
User must sign in to check out
    [Documentation]    This is some basic info about the test
    [Tags]    HoverOver
    open browser    ${URL}    ${BROWSER}
#    Burada Account&List hoverover yapiyoruz. Id veya xpath calisti
#    mouse over    id=nav-link-accountList
    mouse over    xpath=//*[@id="nav-link-accountList"]/span
#    Burada hoverover yaptiktan sonra Create a List tikliyoruz.
#    click link    link=Create a List
#    veya direkt link tiklayabiliriz, bunun icin linkin basina default kelimesi koyabiliriz.
    click link    default=/hz/wishlist/ls?triggerElementID=createList&ref_=nav_ListFlyout_navFlyout_createList_lv_redirect
#    sleep    5n
   close browser
*** Keywords ***
