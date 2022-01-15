*** Settings ***
Documentation    This is some basic info about whole suite
#Notice that we're no longer refrenecing the Library    SeleniumLibrary in our script
#Necessary for Setup&Teardown
Resource    Resources/Common.robot
#Necessary for lower level keywords in test file
Resource    Resources/Amazon.robot
Resource    Resources/AmazonApp.robot

#Setup and Teardown buraya aldik, before and after each test these run every time
#Suite Setup   and Suite Teardown
Suite Setup    Insert Testing Data
Test Setup  Begin Web Test
Test Teardown   End Web Test
Suite Teardown    Cleanup Testing Data

*** Variables ***
#These are scalar variables. only one value so
${BROWSER} =    chrome
${START_URL} =    http://www.amazon.com
${SEARCH_TERM} =    Ferrari 458


*** Test Cases ***
#Bu testcase i tek basina run etmek istedefigimizde
#robot -d results -t "User must sign in to check out" tests\Amazon1.robot
user can search for products
    #Common.Begin Web Test
    Amazon.Search for Products

User must sign in to check out
    [Documentation]    This is some basic info about the test
#smoke testi run etmek icin command=>> robot -d results --include smoke tests\amazon.robot
    [Tags]    Smoke Search
    #    Common.Begin Web Test
    Amazon.Search for Products
    Amazon.Select product from search Results
    Amazon.Add product to Cart
    Amazon.Begin Checkout
#    Common.End Web Test





##Budan asagisini bakarak yazmistim
Logged out user can search for products
    [Tags]    Current
#    robot -d results -i current
#    Ctrl+B to jump to definition
#   Alt+ left to return to parent
    Amazon.Search for Products

#    Creating custom keyword libraries
# Create a module file (.py)
#Add methods -Underscores for spaces
#Declare the library at the top of script\
#Call the method as a keyword
    Amazon.Do Some Custom Things

Logged out user can view a product
    [Tags]    Smoke
    set log level    Debug
    Amazon.Search for Products
    Amazon.Select Products from Search Results
    set log level    info

Logged out user can add product to cart
    [Tags]    Smoke
    Amazon.Search for Products
    Amazon.Select Products from Search Results
    Amazon.Add Product to Cart

Logged out user must sign in to check out
    [Tags]    Smoke
    Amazon.Search for Products
    Amazon.Select Products from Search Results
    Amazon.Add Product to Cart
    Amazon.Begin Checkout

Search page should contain 59 results
    [Tags]    XpathXTimes
    Amazon.Search for Products   ${SEARCH_TERM}
    Amazon.Verify Results Page Contains Products    59


*** Keywords ***

