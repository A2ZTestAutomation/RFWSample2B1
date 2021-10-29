*** Settings ***
Library             SeleniumLibrary 
# Suite Teardown      Close Browser   

*** Variables ***
${URL}        https://demo.opencart.com/
${BROWSER}    chrome

*** Test Cases ***
NavigationTest
       open browser    ${URL}    ${BROWSER}
       Maximize Browser Window
       Input Text    name:search    Phone   
       # Scroll Element Into View    //img[@title='MacBook']
        
        # Execute Javascript    window.scrollTo(10, 900)  
        # Execute Javascript    window.scrollTo(100, document.body.scrollHeight)     
         

       Click Button    xpath://span//button[@type='button']
       
        Go Back
        Sleep     3s
        Execute Javascript    history.go(1)
        ${pageTitle} =    Execute Javascript   return document.title
        Log To Console    ${pageTitle}    
       # Wait Until Element Is Visible    xpath://img[@title='iPhone']
       # sleep     2 s    
        # Capture Element Screenshot    xpath://img[@title='iPhone']     ./element.png   
        # ${pageLoc}=     Get Location
        # Log To Console    ${pageLoc} 
        
        # sleep    2 s
        # Go Back
        
        # sleep     2s
        # Go To    ${pageLoc}
               
        # Title Should Be    Search - Phone      
        
        Capture Page Screenshot    ./page.png