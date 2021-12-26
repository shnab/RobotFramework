*** Settings ***
Documentation    This is some basic info about the whole suite
Library    SeleniumLibrary
*** Variables ***

${BROWSER}  chrome

*** Test Cases ***
# robot -d results tests\Amazon.robot ==> to run
User must sign in to check out
    [Documentation]    This is some basic info about the test
    [Tags]    Smoke
    open browser    http://www.amazon.com   ${BROWSER}
    input text    id=twotabsearchtextbox    Ferrari 458
    click button    css=#nav-search-submit-button
#    image tiklamak icin alt, src,
    click image    RASTAR Ferrari Remote Control Car, 1/24 Scale Ferrari 458 Italia Model Car, Red Ferrari Toy Car

    close browser
*** Keywords ***
