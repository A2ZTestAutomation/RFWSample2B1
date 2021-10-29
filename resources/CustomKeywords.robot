*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${URL}        https://the-internet.herokuapp.com/login
${BROWSER}    chrome
${DELAY}    10s
${LOGIN_BTN}    css:button.radius
${VALID USER}    tomsmith
${VALID PWD}    SuperSecretPassword!

*** Keywords ***
Open Browser to Login
    open browser    ${URL}     ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${DELAY}
    Location Should Contain    login    
    
Input Username
    [Arguments]    ${username}
    Input Text    id:username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id:password    ${password}
    
Submit Credentials
    Click Button    ${LOGIN_BTN}    

Login should have failed
    [Arguments]    ${erroMsg}
    Element Should Contain    id:flash    ${erroMsg}    

    