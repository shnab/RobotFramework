*** Settings ***
Documentation    This is some basic info about whole suite
Library    SeleniumLibrary

*** Variables ***
#vARIBALES altinda set edince BUYUK harrfle yaziliyor
#These are scalar variables. only one value so
#Uppercase global variable anlamina geliyor
#Lowercase scope within a testcase or keyword
#Presedence => Command> Script> Keyword ==> bunlar arasinda override siralamsi bu sekilde

${BROWSER} =    chrome
${START_URL} =    http://www.amazon.com
${SEARCH_TERM} =    Ferrari 458

#    Test icinde de bu sekilde varible set edebiliyoruz. ====
${search_item1} =    Set variable    Ferrari 458

#List varibale settings;
${SEARCH_TERM_ELEMENTS} =    Ferrari 458    Ferrari 458 Ferrari 458

*** Test Cases ***
User can search for products
#Test icinde yazilinca KUCUK harfle yaziliyor
#    Test icinde de bu sekilde variable set edebiliyoruz. ====
    ${search_item1} =    Set variable    Ferrari 458

#    List olarak variable set etme
#   aslinda @ isareti kullaniliyordu, simdi $ da kullanilabiliyor
    ${the_variable_name} =  Set variable    Ferrari 458 Ferrari 458 Ferrari 458
#    create list ile de list create edilebilir
    ${the_variable_name} =  create list    Ferrari 458 Ferrari 458 Ferrari 458

#   List element vagirma [index] ile yapiliyor.
    log    ${the_variable_name}[0]
    log    ${the_variable_name}[1]

Variable demostration
    log     ${SEARCH_TERM_ELEMENTS}[0]
    log     ${SEARCH_TERM_ELEMENTS}[1]
    log     ${SEARCH_TERM_ELEMENTS}[2]





