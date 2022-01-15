*** Settings ***
Documentation    This is some basic info about whole suite
Library    SeleniumLibrary

*** Variables ***
#These are scalar variables. only one value so
${BROWSER} =    chrome
${START_URL} =    http://www.amazon.com
${SEARCH_TERM} =    Ferrari 458
    #    Test icinde de bu sekilde varibale set edebiliyoruz. ====
${search_item1} =    Set variable    Ferrari 458

*** Test Cases ***
# terminal=> robot -d results tests\Amazon.robot ==> to run
# commandline=> C:\development\robot-scripts\amazon robot -d results -i smoke tests\amazon.robot
#smoke testi run etmek icin command=>> robot -d results --include smoke tests\amazon.robot

#Testi run ederken teste ve loga spesifik isim vermek icin
# robot -d results --reporttitle "My cool report" --logtitle "My cool log" tests\amazon.robot

    # --critical(-c) ==> test red-kirmizi olarak report veriyor
# bunun icin [Tags]    foo seklinde tag belirleip ona gore run edebiliriz
# robot -d results --critical foo tests
# --noncritical(-n) ==>test red-kirmizi olarak report vermesini istemiyorsak
# --timestamoutputs (-T) prevents result\log overwriting. Boylece tarih ve saat vererek ayri ayri

    #Normalde robot frameworkde testler alfabetical siraya gore run edilir
#we can can prefix files with XX__ TO change that
#   01__Some_Feature.robot ==> 01 once run edecek
#   02__Another_Feature.robot ==> 02 sonra run edeccek
#run edince raporlarda bu __ underscore gorunmuyor

    # CHANGING ORDER EXECUTION
#Actually it runs in alfabetical order.
#We can also randomize our test cases with --randomize command flag
#    tests, all, suites, none we can run as random
#    robot -d results --randomize suites tests
#robot -d results --randomize tests tests
#robot -d results --randomize all tests
#robot -d results --randomize none tests

    #DEBUGGING AND TRACE
# Logs have a default log level We can change log
#this is ---> dash
#1. Command line
#       --loglevel(-L) debug
#robot -d results -i search -L debug tests/amazon.robot
#2. In the Script
#   Set Log Level Debug
#    [Tags]    Smoke
#    set log level    Debug
#    Amazon.Search for Products
#    Amazon.Select Products from Search Results
#    set log level    info

    # AUTOMATIC VARIABLES
# IN robotframewrok.org we can find extra information

      #RETURN values FROM keywords
#${ReturnedInfo} = A keyword that called it
#[Return] something you want to return
#Ornek
#search results contains relevant products
#    ${ReturnedInfo}=  SearchResults.Verify Search Completed
#    Log    ${ReturnedInfo}
#    [Return]    Bu return etsin. ne return etmesini istersek onu yazariz

    #Creating custom keyword libraries
#    Create a Libraries directory==> under this directory MyCustomLibrary.py
# 1. Create a module file (.py) ==>under Libraries directory==>  MyCustomLibrary.py
# 2. Add methods -Underscores for spaces
# MyCustomLibrary.py icersinde ==> def do_something_special():
 #    print ("Doing something special!")
# 3. Declare the library at the top of script\ ==> Library    ../Libraries/MyCustomLibrary.py
# 4. Call the method as a keyword
#Amazon.Do Some Custom Things ==>

#    UPGRDAE to Consider and LIBRARIES
#python -V ==> version of the
#First upgrade latest Python
#Use ==> pip list
# Execute=>   pip install --upgrade SomeLibrary
#Download current browser versions
#Download current WEBDRIVERS into c:/bin from https://www.selenium.dev/downloads/
#   UNINSTALL
# pip uninstall SomeLibrary
# pip install SomeLibrary==1.21 ==> installing specifiek library
#Update Pycharm & Intellibot

#pypi.python.org ==> we can search libraries
#Robotframeworktutorial.com > to exercise this is a goed option


User can search for products
    [Documentation]    This is some basic info about the test
#smoke testi run etmek icin command=>> robot -d results --include smoke tests\amazon.robot
    [Tags]    Smoke
    #    Test icinde de bu sekilde varibale set edebiliyoruz. ====
#    ${search_item1} =    Set variable    Ferrari 458
    open browser    http://www.amazon.com   chrome
    wait until page contains    Registry
    input text    id=twotabsearchtextbox    Ferrari 458
    click button    css=#nav-search-submit-button
#    click button    xpath=//*[@id="nav-search-submit-text"]
    wait until page contains    results for "Ferrari 458"
    close browser

User can view a product
    [Documentation]    This is some basic info about the test
#smoke testi run etmek icin command=>> robot -d results --include smoke tests\amazon.robot
    [Tags]    Smoke
    #Begin web test
    open browser    about:blank chrome

    #Search for products
    go to    http://www.amazon.com   chrome
    wait until page contains    Registry
    input text    id=twotabsearchtextbox    Ferrari 458
    click button    css=#nav-search-submit-button
    #click button    xpath=//*[@id="nav-search-submit-text"]
    wait until page contains    results for "Ferrari 458"

    #Select product from search Results
    click link    xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[2]/div/span/div/div/div[2]/div[1]/h2/a/span
    wait until page contains    Back to results
    close browser

User can add product to cart
    [Documentation]    This is some basic info about the test
#smoke testi run etmek icin command=>> robot -d results --include smoke tests\amazon.robot
    [Tags]    Smoke
    open browser    http://www.amazon.com   chrome
     wait until page contains    Registry
    input text    id=twotabsearchtextbox    Ferrari 458
    click button    css=#nav-search-submit-button
#    click button    xpath=//*[@id="nav-search-submit-text"]
    wait until page contains    results for "Ferrari 458"
    click link    xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[2]/div/span/div/div/div[2]/div[1]/h2/a/span
    wait until page contains    Back to results
    click button    id=submit.add-to-cart
    wait until page contains    Added to Cart
    close browser



#Bu testcase i tek basina run etmek istedefigimizde
#robot -d results -t "User must sign in to check out" tests\Amazon1.robot
User must sign in to check out
    [Documentation]    This is some basic info about the test
#smoke testi run etmek icin command=>> robot -d results --include smoke tests\amazon.robot
    [Tags]    Smoke
    Begin web test
    Search for products
    Select product from search Results
    Add product to Cart
    Begin Checkout
    End Web Test



*** Keywords ***
Begin web test
    open browser    about:blank    chrome
Search for products
    go to    http://www.amazon.com
#    wait until page contains    Registry
    input text    id=twotabsearchtextbox    Ferrari 458
    click button    css=#nav-search-submit-button
#    click button    xpath=//*[@id="nav-search-submit-text"]
    wait until page contains    results for "Ferrari 458"
Select product from search Results
    click link    xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[2]/div/span/div/div/div[2]/div[1]/h2/a/span
    wait until page contains    Back to results

Add product to Cart
    click button    id=submit.add-to-cart
    wait until page contains    Added to Cart

Begin Checkout
#    click link  Proceed to Checkout
    click link  Sign in securely
    page should contain element    Sign-In
    element text should be  Sign-In

End Web Test
    close browser



#Gherkin
User must sign in to check out Gherkin
    [Tags]    Smoke
    Given   user is not logged in
    And     user searches for products
    And     search result contains relevant products
    And     user select

