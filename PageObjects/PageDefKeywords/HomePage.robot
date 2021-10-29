*** Settings ***
Library    SeleniumLibrary    
Variables    ../Locators/locators.py    
Variables    ../TestDatas/Testdata.py    

*** Keywords ***
Verify welcome text is visible
    Element Should Be Visible    ${WelcomeText}    timeout=5
    
Logout
    Click Element    ${WelcomeText}    
    Wait Until Element Is Visible    ${LogoutButton}  
    Click Element    ${LogoutButton}      
    Wait Until Element Is Visible    ${LoginUsernameInputBox}    
    