*** Settings ***
Resource    ../resources/CustomKeywords.robot
Suite Setup    Open Browser to Login
Suite Teardown    close browser
Test Template    Login with invalid credentials


*** Test Cases ***    USERNAME    PASSWORD    
Invalid Username    invalid    ${VALID PWD}
Invalid Password    ${VALID USER}    invalid
Invalid Username and Password    invalid    invalid
Empty Username        ${EMPTY}       ${VALID PWD}
Empty Password    ${VALID USER}    ${EMPTY}
        

*** Keywords ***
Login with invalid credentials
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    input Password    ${password}
    Submit Credentials
    