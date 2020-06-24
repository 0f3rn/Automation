*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://www.google.com
${URL2}  http://testautomationplayground.northeurope.cloudapp.azure.com:8080/
${Browser}  Chrome
${user}  oscar
${pass}  abcd1234
${welcome_controltext}    Welcome!
${element_signin}  xpath://span[text()="Sign in"]
${element_input_username}   xpath://input[@formcontrolname="username"]
${element_input_password}   xpath://input[@formcontrolname="password"]
${button_signin}  xpath://app-sign-in-or-up-dialog//button[contains(., 'Sign in')]
${element_welcomeMessage}  xpath://span[contains(@class, 'welcomeMessage')]

*** Test Cases ***
Open_Google
    Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Input Text  xpath://input[@type="text"]  Oscar Fernandez
    Press Keys  xpath://input[@type="text"]  RETURN
    Click Link  xpath://a[contains(@href, 'wikipedia')]
    Close Browser

Add_Products
    [Tags]   product
    Open Browser  ${URL2}  ${Browser}
    Maximize Browser Window
    Click Element  xpath://mat-card[2]//button
    Click Element  xpath://mat-card[6]//button
    Element Text Should Be  xpath://div[@class="cartDigit"]  2

Login
    Open Browser To Home Page
    Input Credentials and Submit
    Verify Login
    Close


*** Keywords ***
Open Browser To Home Page
    Open Browser  ${URL2}  ${Browser}
    Maximize Browser Window

Input Credentials and Submit
    Click Element   ${element_signin}
    Input Text  ${element_input_username}   ${user}
    Input Text  ${element_input_password}  ${pass}
    Click Button  ${button_signin}

Verify Login
    Wait Until Page Contains Element  ${element_welcomeMessage}
    Element Text Should Be  ${element_welcomeMessage}    ${welcome_controltext}

Close
    Close Browser