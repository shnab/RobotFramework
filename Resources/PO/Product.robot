*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verify Page Loaded
#Buraya to do ekleyebeiliyoruz. Boylece alt ekranda gorebilriz.
#Birden fazla to do yazilabilir
# TODO is used to check if we have TODO
# TODO Complete
# TODO NO ACTION TAKEN
    Wait Until Page Contains  Back to search results

Add to Cart
    Click Button  id=add-to-cart-button