*** Settings ***
Library             SeleniumLibrary 
# Suite Teardown      Close Browser   

*** Variables ***

*** Test Cases ***
RightClickTest
       open browser    http://swisnl.github.io/jQuery-contextMenu/demo.html    chrome
       Maximize Browser Window
       Open Context Menu    xpath://span[text()='right click me']
       sleep     3s
       
DoubleClickTest
       go to     https://testautomationpractice.blogspot.com/
       Input Text    id:field1    Welcome    
       sleep    3s
       # Click Button    //button[text()='Copy Text']    
       Double Click Element    xpath://button[text()='Copy Text']
       
        sleep    3s
        Drag And Drop    id:draggable    id:droppable