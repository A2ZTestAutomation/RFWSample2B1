*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${BROWSER}    chrome
${URL}    https://demo.seleniumeasy.com/basic-select-dropdown-demo.html

*** Keywords ***
Open Application
    Open Browser       ${URL}    ${BROWSER} 
    Maximize Browser Window

Close Application
    Close Browser
    

    