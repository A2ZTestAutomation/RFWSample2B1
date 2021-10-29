*** Settings ***
Library             SeleniumLibrary 
Suite Teardown      Close Browser   

*** Variables ***
${URL}        https://demo.seleniumeasy.com/javascript-alert-box-demo.html
${BROWSER}    chrome

*** Test Cases ***
Handle SimpleAlert 
       open browser    ${URL}    ${BROWSER}
       Click Button    xpath:(//button[contains(text(), 'Click me!')])[1]
      
        Handle Alert    ACCEPT           

        Click Button    xpath:(//button[contains(text(), 'Click me!')])[2]
        sleep     3s    
       ${alertText} =    Handle Alert
       Log To Console    ${alertText}         
       
        
        Click Button    xpath://button[contains(text(), 'Prompt')]    
        sleep     2s
        Input Text Into Alert    Hello Welcome 
        # Handle Alert    dismiss   
        
        