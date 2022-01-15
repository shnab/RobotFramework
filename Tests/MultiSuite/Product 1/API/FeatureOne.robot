*** Settings ***

*** Variables ***

*** Test Cases ***
#How to run all test cases with a single line command
#run this code ==> robot -d results tests\multisuite

#=> -N "Full Regression" ile specifik birr isim verebiliriz.
#==>robot -d results -N "Full Regression" tests\multisuite


#Eger bazi pazkageleri run etmek istersek
#robot -d results -N "Product 1 Full Regression" "tests\multisuite\product 1"

#Sadece tek testcase -t "Test Case 1"
#==> robot -d results -t "Test Case 1"
#                        "tests/multisuite/product 1/web/featureone.robot"

Test Case 1
#Eger tag ile run etmek istersek
# dash -i ==> -i CurrentTestCase
#robot -d results -N "Single Test Case" -i CurrentTestCase tests
    [Tags]   CurrentTestCase
    log    I am a test case 1 of API feature 1
Test Case 2
#Ayni anda birden fazla tag veya testcase run edilebilir
#robot -d results -N "Single Test Case" -i CurrentTestCase -i CurrentTestCase2 tests
    [Tags]   CurrentTestCase2
    log    I am a test case 2 of API feature 1

*** Keywords ***
