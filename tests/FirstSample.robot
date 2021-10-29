*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        https://the-internet.herokuapp.com/login
${HL_BROWSER}    headlesschrome

*** Test Cases ***
First Testcase
       log  Welcome

Valid LoginTest
    open browser    ${URL}     ${BROWSER}
    Maximize Browser Window
    # Input Text    id:username    tomsmith

    # Input Password    name:password    SuperSecretPassword!   
    # Input Text    name:password    SuperSecretPassword!
    # Input Text    xpath://input[@id='username' and @type='text']    tomsmith
    # Input Text    xpath://input[@name='password']   SuperSecretPassword!
    # Click Button    xpath://button[@class='radius']  
    # Click Button    tag:button    
    # Click Button    class:radius    
    Input Text    css:#username    tomsmith
    Input Text     css:input[name=password]     SuperSecretPassword!
    Click Button    class:radius  
      # Click Button    xpath:${btnXpath}
      # Element Should Contain    id:flash    You logged into a secure area! 
     Element Should Be Visible    css:.flash.success
     ${succesMsg}    Get Text    css:.flash.success  
     Log To Console    ${succesMsg}                
    Close Browser

Invalid Username LoginTest
     open browser    ${URL}     ${BROWSER}
    Maximize Browser Window
    Input Text    css:#username    toms
    Input Text     css:input[name=password]     SuperSecretPassword!
    Click Button    css:.radius 
    Element Should Contain    id:flash    Your username is invalid!    
    Close Browser
   

    

