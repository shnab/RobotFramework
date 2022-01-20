*** Settings ***
Library    SeleniumLibrary

#Burasi teardown vs icin olusturduk
*** Variables ***
#${BROWSER}    chrome

#*** Keywords ***
#Begin Web Test
#    OPEN BROWSER    about:blank     chrome
#    MAXIMIZE BROWSER WINDOW
#
#End Web Test
#    CLOSE BROWSER

*** Keywords ***
Begin Web Test
    set selenium timeout  30 seconds
    Open Browser  about:blank   ${BROWSER}

End Web Test
    Close Browser

Insert Testing Data
    Custom Keyword 1
    Custom Keyword 2

Cleanup Testing Data
    Log    I am cleaning up the test data

Custom Keyword 1
    Log    Doing keyword 1 I am setting up the test data

Custom Keyword 2
    Log    Doing keyword 2 I am setting up the test data



#*** Keywords ***
#
#Begin Web Test
#    open browser    about:blank    chrome
#
#End Web Test
#    close browser