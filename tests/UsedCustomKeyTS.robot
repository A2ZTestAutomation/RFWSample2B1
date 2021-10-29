*** Settings ***
Resource    ../resources/CustomKeywords.robot
Test setup    Open Browser to Login


*** Test Cases ***
Login with InvalidUser
    Input Username    tomsmith1
    Input password    SuperSecretPassword!
    Submit Credentials
    Login should have failed    Your username is invalid!
    
Login with InvalidPassword
    Input Username    tomsmith
    Input password    SuperSecretPass
    Submit Credentials
    Login should have failed    Your password is invalid!
    