*** Settings ***

*** Test Cases ***
Generate Invoice
       Log To Console    Generate Invoice Test 
       
Make Payment
    [Tags]    RegTest
    Log To Console    Make Payment    