*** Settings ***
Library             SeleniumLibrary 
# Suite Teardown      Close Browser   

*** Variables ***
${URL}        https://the-internet.herokuapp.com/dynamic_loading/2
${BROWSER}    chrome
${DELAY}        10s
*** Keywords ***
Initialize
     Open browser    ${URL}   ${BROWSER}
     Maximize Browser Window 
TearDown
    Close Browser
    
SynchTest
    Initialize
    Click Button    //button[text()='Start']    
    # sleep    10s
    ${impWait}=    Get Selenium Implicit Wait
    Log To Console    "Impl Wait : ", ${impWait}        

    ${speed}=    Get Selenium Speed
    Log To Console    "Selenium Speed : ", ${speed}    
    Set Selenium Speed    10s
    ${defImp}=    Get Selenium Timeout
    Log To Console    "Default  wait : ", ${defImp}   
    # Set Selenium Implicit Wait    ${DELAY} 
    # Set Selenium Timeout    10s
    Wait Until Element Is Visible    //h4[text()='Hello World!']      
    ${afterTimeout}=    Get Selenium Timeout
    Log To Console    "AfterTimeout  wait : ", ${afterTimeout}   
    
    ${dynText}    Get Text    //h4[text()='Hello World!']
    Log To Console    ${dynText}    
    teardown
*** Test Cases ***
DynamicElementTest
      SynchTest
    
    
    