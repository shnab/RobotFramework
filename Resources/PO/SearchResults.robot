*** Settings ***
Documentation    Amazon top navigation
Library    SeleniumLibrary

*** Variables ***
${ExpectedProductCount}    63

*** Keywords ***
Verify Search Completed
    wait until page contains    results for "Ferrari 458"
#    ne return etmesini istersek onu yazariz
    [Return]    Found it!


Click Product link
    [Documentation]    Clicks on first product in the search results list
    click link    xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[2]/div/span/div/div/div[2]/div[1]/h2/a/span

Verify Product Count
    [Arguments]     ${ExpectedProductCount}
#    xpath should match x times      //div[contains(@data-cel-widget,"search_result_")]    ${ExpectedProductCount}

