*** Settings ***
Resource  ../Resources/Common.robot
Resource  ../Resources/ImbApp.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test



# robot -d results -i landing tests/IMB_Tests.robot
#Belirli bir BROWSER VE ENVIRONMENT run etmek icin using into a BATCH file or TRIGGER from JENKINS
# robot -d results -i landing -v BROWSER:chrome -v ENVIRONMENT:qa tests/IMB_Tests.robot
# robot -d results -i landing -v BROWSER:chrome -v ENVIRONMENT:prod tests/IMB_Tests.robot
#&{URL}    ==>dictionary ornegi to store data

*** Variables ***
#Burada ${ENVIRONMENT} key, URL ==>value
${ENVIRONMENT} =  dev
${BROWSER} =  chrome
#Dictionary ==>&{URL} key=value olarak yaziliyor
&{URL}  dev=http://dev.internetmillionaireblueprint.com  qa=http://qa.internetmillionaireblueprint.com  stage=http://stage.internetmillionaireblueprint.com  prod=http://www.amazon.com
#1. Adim Burada dictionary declare et, sonra asagida kullanilacagi yerden cagir
&{CUSTOMER_USER}  FirstName=Bryan  LastName=Lamb  Dob=1/1/1900  Email=bryan@robotframework.com  Password=MyPassword!
&{ADMIN_USER}  FirstName=Joe  LastName=Smith  Dob=1/1/1900  Email=admin@robotframework.com  Password=AdminPassword!

*** Test Cases ***
Should be able to view landing page
    [Tags]  landing
    ImbApp.Navigate to Landing Page
    Sleep  5s

Should be able to register for new account
    [Tags]  register
    ImbApp.Navigate to Landing Page
    Sleep  5s
#   2. Adim Yukarida declare edilen dictionary buraya &{CUSTOMER_USER} ==> $ ile yapistir.
    ImbApp.Create New Account  ${CUSTOMER_USER}
