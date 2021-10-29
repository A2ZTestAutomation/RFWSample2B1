*** Settings ***
Library             SeleniumLibrary 
# Suite Teardown      Close Browser   

*** Variables ***
${URL}        https://www.chercher.tech/practice/frames
${BROWSER}    chrome

*** Test Cases ***
NavigationTest
       open browser    ${URL}    ${BROWSER}
       Maximize Browser Window
       
        ${label}    Get Text    xpath://label/span
        Log To Console    ${label}   
        
        # From Main content to frame1
        Select Frame    id:frame1
        input text    xpath://b[@id='topic']/following-sibling::input    Hello Welcome
        
        # Frame1 to Frame3
        select Frame     id:frame3
        Select Checkbox    id:a 
        
        # Back to main content
        Unselect Frame
        # From Main content to frame1
         Select Frame    id:frame1
        input text    xpath://b[@id='topic']/following-sibling::input    WELCOME BACK
        
