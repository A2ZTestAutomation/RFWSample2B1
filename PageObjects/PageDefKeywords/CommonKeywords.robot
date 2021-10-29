*** Settings ***
Library    SeleniumLibrary    
Variables    ../Locators/locators.py

*** Keywords ***
Open browser with login page
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Wait Until Element Is Visible    ${LoginUsernameInputBox} 
    
App TearDown
    Close All Browsers   