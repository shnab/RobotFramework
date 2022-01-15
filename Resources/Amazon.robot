*** Settings ***
#Bu custom method file, script in en ustune yaziyoruz.
Library    ../Libraries/MyCustomLibrary.py
Resource    Resources/PO/LandingPage.robot
Resource    Resources/PO/TopNav.robot
Resource    Resources/PO/SearchResults.robot
Resource    Resources/PO/Product.robot
Resource    Resources/PO/Cart.robot
Resource    Resources/PO/SignIn.robot

#Procedurel and Gherkin results we have.



*** Keywords ***

#Bu keywords is in common.robot rigth now
#Begin web test
#    open browser    about:blank    chrome

Do Some Custom Things
    Do something special

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

#common.robot right now
#End Web Test
#    close browser

#============================
#Burdan asagisini kendim yazmistim
user is not logged in
    log    Check to see whether user is logged in

Search for Products
    LandingPage.Load
    LandingPage.Verify Page Loaded
    TopNav.Search for Products
    SearchResults.Verify Search Completed


Select Products from Search Results
    SearchResults.Click Product link
    Product.Verify Page Loaded

Add Product to Cart
    Product.Add to Cart
    Cart.Verify Product Added

Begin Checkout
    Cart.Proceed to Checkout
    SignIn.Verify Page Loaded

Verify Results Page Contains Products
    [Arguments]     ${ExpectedProductCount}
    SearchResults.Verify Product Count    ${ExpectedProductCount}