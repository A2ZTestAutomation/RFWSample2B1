
*** Settings ***
Library    RequestsLibrary
Library    Collections        

*** Variables ***
${base_url}    http://postman-echo.com
${git_url}    https://api.github.com
${bearerUrl}    https://gorest.co.in/public-api/users

*** Test Cases ***
BasicAuthWithUserID
    @{auth_list}    Create List    postman    password
    Create Session    myBasicAuth    ${base_url}    auth=${auth_list}
    ${response}    Get On Session    myBasicAuth    /basic-auth
    Log to console    ${response.status_code}
    Log To Console     Using BasicAuth${response.content}  
     
OAuthReques
     &{auth_list}    Create Dictionary    Authorization=Token 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
    Create session     myAuth2     ${git_url}    headers=${auth_list}
    ${response}    Get on session    myAuth2    /user/repos    
    Log to console    ${response.status_code}
    Log To Console    Using AccessToken ${response.content}    

BearerTokenAuth
    &{auth}    Create Dictionary    Authorization=Bearer b8c87e237c1c43cd079cbecef302025986abb7a48864a0b66d31b7742cda36ea
    Create Session    myGetSess    ${bearerUrl}     
    ${response}    Get On Session    myGetSess     /45     headers=${auth}    
    Log To Console    ${response.status_code}    
    Log To Console    Using BearerToken ${response.content}