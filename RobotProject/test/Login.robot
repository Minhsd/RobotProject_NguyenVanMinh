*** Settings ***
Library    SeleniumLibrary    


Suite Setup            Log    Login Test Suite Start   
Suite Teardown         Log    This test was executed by %{username} on %{os}   
Test Setup             Open Browser    ${URL}    ${BROWSER}                       
Test Teardown          Close Browser
Default Tags           Login  

*** Variables ***
${URL}                http://demo.guru99.com/V1/index.php
${BROWSER}            ie
${email}              systemdrivervn@gmail.com           
@{message}            User-ID must not be blank    Password must not be blank



*** Keywords ***



*** Test Cases ***

CheckInputTextField
    [Documentation]               this is check login   
    Maximize Browser Window
    Click Element                 name=uid
    Click Element At Coordinates  name=uid         50    50    
    Element Text Should Be        id=message23     ${message}[0]   
                
    Click Element                 name=password
    Click Element At Coordinates  name=password    50    50   
    Element Text Should Be        id=message18     ${message}[1]  
GenerateAccessAndLogIn
    Set Browser Implicit Wait     3
    Maximize Browser Window
    Click Element                 link=here   
    Input Text                    name=emailid     ${email}
    Submit Form       
    ${userID}       Get Text      xpath=//table/tbody/tr[4]/td[2]
    ${password}     Get Text      xpath=//table/tbody/tr[5]/td[2]    
    Go Back
    Go Back    
    Input Text                    name=uid         ${userID}
    Input Text                    name=password    ${password}
    Submit Form               
    Element Text Should Be        xpath=//div[3]/div/ul/li[1]/a    Manager 
    Set Browser Implicit Wait     0    