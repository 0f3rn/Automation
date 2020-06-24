*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://www.google.com
${Browser}  Chrome

*** Test Cases ***
Open Google and Search for my Name
    Open Browser    ${URL}  ${Browser}
    Maximize Browser Window
    Input Text  xpath://input[@type="text"]  Oscar Fernandez
    Press Keys  xpath://input[@type="text"]  RETURN
    Click Link  xpath://a[contains(@href, 'wikipedia')]
    Close Browser


*** Keywords ***
