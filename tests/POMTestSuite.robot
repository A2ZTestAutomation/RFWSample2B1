*** Settings ***
Resource    ../PageObjects/PageDefKeywords/LoginPage.robot
Resource    ../PageObjects/PageDefKeywords/CommonKeywords.robot
Resource    ../PageObjects/PageDefKeywords/HomePage.robot
Suite Teardown    App TearDown


*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
${BROWSER}    chrome


*** Test Cases ***
Verify Successful Login to OrangeHRM
    Open browser with login page    ${URL}    ${BROWSER}
    Input Username
    Input Pwd
    Click Login
    Verify welcome text is visible
    Logout
    
    

    
    