
*** Test Cases ***
Sample TestCase
    ${sum}=    Add   10    20
    Log to console    "Sum is : ",${sum}
    Should Be Equal As Integers    30    ${sum} 
    ${ChangedName}    Change Nickname    TestUser    RobotTestUser
    Print Console     ${ChangedName}    False
    
*** Keywords ***
Add 
    [Arguments]    ${value1}    ${value2}
    ${sum}    Evaluate    ${value1}+${value2}
    [return]    ${sum}
    
Change Nickname
    [Arguments]    ${oldname}    ${newname}
    [return]    ${newname}    

Print Console
    [Arguments]    ${anyText}=Hello   ${flag}=True 
    # [Arguments]    ${anyText}   ${flag}
    # Run Keyword If    true    Log    Print in log
    Run Keyword If     ${flag}      Log    ${anyText}
    ...    ELSE    Log To Console    ${anyText}    
       
    
    # Log To Console    The text is:    ${anyText}