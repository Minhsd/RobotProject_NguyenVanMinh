*** Settings ***
Library    SeleniumLibrary    


Suite Setup            Log    I am inside Test Suite Setup   
Suite Teardown         Log    I am inside Test Suite Teardown   
Test Setup             Open Browser    ${URL}    chrome
                         
Test Teardown          Close Browser  

*** Variables ***
${URL}    http://demo.guru99.com/V1/index.php
${UserIDElement} =       name=uid
${PasswordElement} =     name=password
${UserIdMessage}=    id=message23
${PasswordMessage}=    id=message18
${ManagerConfirm}=    xpath=//div[3]/div/ul/li[1]/a

*** Keywords ***



*** Test Cases ***

CheckInputTextField
    [Documentation]    this is check login test   
    Click Element      ${UserIDElement}
    Click Element At Coordinates    name=uid    50    50    
    Element Text Should Be    ${UserIdMessage}      User-ID must not be blank
    Log                ${UserIdMessage}          
    Click Element      ${PasswordElement}
    Click Element At Coordinates    name=password    50    50   
    Element Text Should Be    ${PasswordMessage}    Password must not be blank
    Log                ${PasswordMessage}   
GenerateAccess
    Click Element      link=here   
    Input Text        name=emailid    systemdrivervn@gmail.com
    Click Button    name=btnLogin   
    ${UserID}=    Get Text    xpath=//table/tbody/tr[4]/td[2]
    ${Password}=     Get Text    xpath=//table/tbody/tr[5]/td[2]    
    Go Back
    Go Back    
    Input Text    ${UserIDElement}    ${UserID}
    Input Text    ${PasswordElement}  ${Password}
    Submit Form               
    #
    Element Text Should Be    ${ManagerConfirm}    Manager     