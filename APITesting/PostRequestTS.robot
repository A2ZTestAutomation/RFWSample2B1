
*** Settings ***
Library    RequestsLibrary
Library    Collections     
Library    JSONLibrary       

*** Variables ***
${base_url}   https://jsonplaceholder.typicode.com/
${put_url}     https://jsonplaceholder.typicode.com/posts
${bearerUrl}    https://gorest.co.in/public-api

*** Test Cases ***
PostRequestTest
    Create Session    myPostSess    ${base_url}    
    &{body}   Create Dictionary    userId=1000    title=RFW    body=Api Testing
    Log To Console    ${body} 
    &{header}    Create Dictionary    Cache-Control=no-cache
    ${response}    Post On Session     myPostSess    /posts    data=${body}     headers=${header}
    Log To Console    ${response.status_code}         
    Log to Console    ${response.content}
    
    ${id}    Get Value From Json    ${response.json()}    id
    ${idFromList}   Get From List    ${id}    0 
    ${idAsString}    Convert To String     ${idFromList}
    Should Be Equal As Strings    ${idAsString}    101     
    
    ${headerValues}    Get From Dictionary    ${response.headers}        Content-Type
    
    # Run Keyword If    ${headerValues}==application/json; charset=utf-8    name    
    ${bodyAsString}    Convert JSON To String    ${response.json()}
    Should Contain    ${bodyAsString}    101   
    
# PutRequestTest
      # Create Session    myPutSess    ${put_url}    
    # &{body}   Create Dictionary    userId=1000    title=RFWAPI    body=Api Testing
    # Log To Console    ${body} 
    # &{header}    Create Dictionary    Cache-Control=no-cache
    # ${response}    Put On Session     myPutSess    /15   data=${body}     headers=${header}
    # Log To Console     ${response.status_code}    
    # Log to console    ${response.content}  
    
    # ${strRes}    Convert To String     ${response.content} 
    # Should Contain    ${strRes}    RFWAPI    
    

PostWithBearerToken
    create session     myPostSess    ${bearerUrl}    verify=true
    &{body}    Create Dictionary    name=TestAutomation    gender=female    email=xyz@gmail.com    status=Active
    &{header}    Create Dictionary    authorization=Bearer e64b76b6e7e8e5f2f31663dd13bb4b814ee025ccc68aec83ab73322abf1b538b
    ${response}    Post On Session    myPostSess    /users   data=${body}    headers=${header}
    Log To Console    ${response.status_code}     
    

PostWithJsonFile
    Create Session    myPostSess    ${base_url}   
    &{jsonContent}    Load JSON From File    F:\\Anandhi\\workspace\\robotframework\\RFWSamplesB1\\APITesting\\postData.json
    Log To Console    ${jsonContent}    
    &{header}    Create Dictionary    Cache-Control=no-cache    Content-Type=application/json; charset=utf-8    
    ${response}    Post On Session    myPostSess    /posts    data=${jsonContent}    headers= ${header}
    
    Log To Console    ${response.status_code}    
    Log To Console    Post Json content ${response.content}    