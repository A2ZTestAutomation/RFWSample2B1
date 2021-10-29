*** Settings ***
Library    SeleniumLibrary    
Variables    ../Locators/locators.py        
Variables    ../TestDatas/Testdata.py    

*** Keywords ***
Input Username
    
    Input Text    ${LoginUsernameInputBox}  ${Username}

Input Pwd
    Input Text    ${LoginPasswordInputBox}    ${Password}    
    

Click Login
    Click Element    ${LoginButton}     