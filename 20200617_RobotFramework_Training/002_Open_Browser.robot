*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://testautomationplayground.northeurope.cloudapp.azure.com:8080/
${Browser}  Chrome

*** Test Cases ***
Add Products and Verify
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Click Element  xpath://mat-card[2]//button
    Click Element  xpath://mat-card[6]//button
    Element Should Contain  xpath://div[@class="cartDigit"]  2