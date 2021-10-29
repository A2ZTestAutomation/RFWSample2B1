*** Settings ***
# Reading from csv file 
# Library    DataDriver
# Reading from excel with the name loginData

Library    DataDriver    file=${FILENAME}    sheet_name=loginPage
Resource    ../resources/CustomKeywords.robot
Suite Setup    Open Browser to Login
# Suite Teardown    close browser
Test Template    Login with invalid credentials

*** Variables ***
${username11}
${password11}
${USER}
${FILENAME}    loginData.xlsx

*** Test Cases ***
Login with user ${username11} and password ${password11}  Default     UserData   



*** Keywords ***
Login with invalid credentials
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    input Password    ${password}
    Submit Credentials