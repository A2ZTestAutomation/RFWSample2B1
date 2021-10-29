*** Settings ***
Library             SeleniumLibrary 
# Suite Teardown      Close Browser   

*** Variables ***
${URL}        https://www.stqatools.com/demo/Windows.php
${BROWSER}    chrome

*** Test Cases ***
# Handle TabbedWindow
       # open browser    ${URL}    ${BROWSER}
       # Maximize Browser Window
       # ${parentWin} =     Get Window Handles 
       # Log To Console    ${parentWin}[0]       
       # Click Button    xpath://button[contains(text(), 'new Tab')]
       # @{winHandles} =     Get Window Handles
       # ${openedWins} =     Get Length      ${winHandles}
       # Log To Console    "Number of Opened Win :", ${openedWins}  
         
         # Switch Window        ${winHandles}[1]
        # sleep     3s
        
        # Click Element    xpath:(//span[@class='menu-text' and contains(text(), 'Java')])[1]    
        
        # Title Should Be    JAVA for Selenium WebDriver from Basic to Advance with Example
        # Close Window    
        # Close Browser
           
       
Handle BrowserWindow
    open browser    ${URL}    ${BROWSER}
       Maximize Browser Window
       Click Button    xpath://button[contains(text(), 'new Window')]
       
       @{broswerIDs}=    Get Browser Ids
       Log Many    ${broswerIDs}  
       Log To Console    ${broswerIDs}[0]    
       Switch Browser    ${broswerIDs}[0] 
       Sleep     3s
       Click Button    xpath://button[contains(text(), 'Message Window')]
       Close Browser
       # Close All Browsers
       
       
    