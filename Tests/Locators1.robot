*** Settings ***
Documentation    This is some basic info about the whole suite
Library    SeleniumLibrary
*** Variables ***

${BROWSER}  chrome
${URL}      http://www.amazon.com

*** Test Cases ***
# robot -d results tests\Amazon.robot ==> to run
#User must sign in to check out
#    [Documentation]    This is some basic info about the test
#    [Tags]    Smoke
#    open browser     ${URL}   ${BROWSER}
#    input text    id=twotabsearchtextbox    Ferrari 458
#    click button    css=#nav-search-submit-button
##    image tiklamak icin alt, src,
#    click image    RASTAR Ferrari Remote Control Car, 1/24 Scale Ferrari 458 Italia Model Car, Red Ferrari Toy Car
#    close browser

#to run ==>robot -d results tests\Locators1.robot
Should be able to do something
    open browser     ${URL}   ${BROWSER}
#    click link    id=nav-your-amazon
# html name ==> click link   nav-your-amazon ==> link= yazmadan da boyle bile calisir
#    click link   *name=nav-your-amazon
#Ekranda gordugumuz linki oldugu gibi yaziyoruz. Alttaki ikisi ayni anlamda
    click link    link=Customer Service
    click link    Customer Service
#    #Ekranda gordugumuz linkin bir kismini yaziyoruz.
    click link    partial link=tumer Service
#   click link     xpath=//div[@id='nav-xshop']/a[@href='/gp/help/customer/display.html?nodeId=508510&ref_=nav_cs_customerservice']
    click link    css=#nav-xshop > a:nth-child(3)
#   Image tiklamak icin burada alt, id, name kullanabiliriz.
    click image      Headsets
    close browser

#        Advanced Locators
#    xpath and css have a similar syntax as tag[attribute='some value']
#                         a=>tag and @=>attribute and *==> any tag
#   click link     xpath=//a[@id='Foo']
#click link     xpath=//*[@id='Foo']
#    click link    css=a[id='Foo'] is same => #Foo

#Amazon search box icin CSS   => form[role='search'] veya form[class='nav-searchbar nav-progressive-attribute']
#Amazon search box icin XPATH => //form[@role='search']

# ABSOLUTE AND RELATIEF TAG RELATIONSHIPS
#Xpath ile css farki
#xpath = //div[@id='DetailPage']/a
#css = div[id='DetailPage']>a

#Customer Service xpath ==>(//div[@id='nav-xshop']/a)[2] ==> once parent bul sonra child gel
#Customer Service css  => div[id='nav-xshop']>a[data-csa-c-slot-id="nav_cs_1"]
#Customer Service css  => div[id='nav-xshop']>a:nth-child(3)

#input volledig xpath ==> /html/body/div[1]/header/div/div[1]/div[2]/div/form/div[3]/div/span/input
#//*[@id="nav-search-submit-button"]
#//div[@class="nav-search-submit nav-sprite"]//input
#CSS=> div[class="nav-search-submit nav-sprite"] input ==> ] input arada bosluk biraktik.
#CSS=> div[class="nav-search-submit nav-sprite"]>span>input ==> aynisi
#//div[@class="nav-right"]//input

#   INPUT
#==>//*[@id="nav-search"]/form/div[2]/div/input
#==>//*[@id="nav-search"]//input
#==>//div[@id="nav-search"]//input

#   PARTIAL LOCATORS
#    START WITH css=^ ==> carrot equals sign
# xpath ==> //input[@type='Submit-345321']
#          //input[starts-with(@type,'Submit')]
#//input[@type="submit"]==> //input[starts-with(@type,"submit")]  ==>input[type^="sub"]
# CSS ==> input[type='Submit-345321']
#          input[type^='Submit']

#    ENDS WITH ==> css=% ==>dolar sign
#//input[@type="submit"]
#==> //input[ends-with(@type,"submit")]
#==> input[type$="submit"]

#   CONTAINS ==> css=* ==>asteriks
#   //input[@type="submit"]
#==> //input[contains(@type,"ubm")]
#==> input[type="ubm"]

#    TEXT()
#   //a[contains(text(), 'Full or Partial Link Text')]
#    //a[contains(., 'Full or Partial Link Text')]
#Footer kismindaki table element==>  //a[contains(text(), 'Sell apps on Amazon')]
#   . koyunca bazen farkli sonuc gelebilir.DIKKAT!
#       //a[contains(., 'Sell apps on Amazon')] ==>//li/a[contains(., 'Sell apps on Amazon')]

#    xpath should match x times varmis simdi yok
#//div[contains(@data-cel-widget,"search_result_")] =63
 #Bu ornek olarak burada kaldi
#Search page should contain 30 results
#    AmazonApp.Search for Products   ${SEARCH_TERM}
#    AmazonApp.Verify Results Page Contains Products 63



*** Keywords ***
