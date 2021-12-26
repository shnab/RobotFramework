*** Settings ***
Documentation    This is some basic info about whole suite
Library    SeleniumLibrary
*** Variables ***

*** Test Cases ***
# terminal=> robot -d results tests\Amazon.robot ==> to run
# commandline=> C:\development\robot-scripts\amazon robot -d results -i smoke tests\amazon.robot
#smoke testi run etmek icin command=>> robot -d results --include smoke tests\amazon.robot
User must sign in to check out
    [Documentation]    This is some basic info about the test
#smoke testi run etmek icin command=>> robot -d results --include smoke tests\amazon.robot
    [Tags]    Smoke
    open browser    http://www.amazon.com   chrome
#    wait until page contains    Registry
    input text    id=twotabsearchtextbox    Ferrari 458
    click button    css=#nav-search-submit-button
#    click button    xpath=//*[@id="nav-search-submit-text"]
    wait until page contains    results for "Ferrari 458"
    click link    xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[2]/div/span/div/div/div[2]/div[1]/h2/a/span
    wait until page contains    Back to results
    click button    id=submit.add-to-cart
    wait until page contains    Added to Basket

    click link    Proceed to checkout
    page should contain element    Sign-In
    element text should be    Sign-In   Sign-In

    sleep    3s
    close browser

*** Keywords ***

