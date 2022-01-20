*** Settings ***
Library  String

#       LOOPS
#    Eski syntax
#     :FOR  ${Index}  IN RANGE  1  4
  #    \  Do Something  ${Index}
  #    \  ${RANDOM_STRING} =  Generate Random String  ${Index}
  #    \  Log  ${RANDOM_STRING}

#    Yeni syntax
#    FOR  ${Index}  IN RANGE  5
 #      Do Something  ${Index}
 #      ${RANDOM_STRING} =  Generate Random String  ${Index}
 #      Log  ${RANDOM_STRING}
 #    END

*** Test Cases ***
#Range index 0 dan basliyor, 5 e kadar. 5 dahil degil
FOR Loop with Upper Bounds Range
    [Documentation]  This gives us a 0 based range
    FOR    ${Index}  IN RANGE  5
      Do Something  ${Index}
      ${RANDOM_STRING} =  Generate Random String  ${Index}
      Log  ${RANDOM_STRING}
    END

# Loop range 1<4 den basliyor
FOR Loop with Start and Finish Range
    [Documentation]  No longer a 0 based range because I provided start
    FOR  ${Index}  IN RANGE  1  4
      Do Something  ${Index}
      ${RANDOM_STRING} =  Generate Random String  ${Index}
      Log  ${RANDOM_STRING}
    END

#1 den baslar until 10 and with 2 artis
FOR Loop with Start, Finish, and Step Range
    [Documentation]  The counter will jump by 2 each time ("step" value = 2)
    FOR  ${Index}  IN RANGE  1  10  2
       Do Something  ${Index}
       ${RANDOM_STRING} =  Generate Random String  ${Index}
       Log  ${RANDOM_STRING}
    END

#List ile loop kullanimi
FOR Loop with List
#List creation
    @{ITEMS} =  Create List  Item 1  Item 2  Item 3
#Burada loop olusturuluyor
    FOR  ${MyItem}  IN  @{ITEMS}
       Log  ${MyItem}
    END
#
Exit a FOR Loop
    @{ITEMS} =  Create List  Item 1  Item 2  Item 3  Item 4

    FOR  ${MyItem}  IN  @{ITEMS}
       Log  ${MyItem}
#       Eger burada list icerisindeki "${MyItem}" == "Item 3" esit olursa loopdan cik
       Run Keyword If  "${MyItem}" == "Item 3"  Exit For Loop
       Log  Didn't exit yet
    END

    Log  Now we're out of the loop

#Keywordlari tekrar etmek icin
Repeat a keyword many times
    Repeat Keyword  5  A Repeatable Keyword
    Repeat Keyword  2 times  A Repeatable Keyword
    Repeat Keyword  2 x  A Repeatable Keyword
#   3m 10s => Bu specifik time icin run eder
#Ayrica her run ettiginde execution icin ne kadar sure kaldigini gosterir
    Repeat Keyword  3 s  A Repeatable Keyword

*** Keywords ***
Do Something
    [Arguments]  ${PassedIndex}
    Log  I was passed a value of ${PassedIndex}!

A Repeatable Keyword
    Log  I am being repeated!