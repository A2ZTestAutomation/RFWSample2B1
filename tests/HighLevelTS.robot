*** Settings ***
Library             SeleniumLibrary 
# Suite Teardown      Close Browser   

*** Variables ***
${URL}       https://the-internet.herokuapp.com/login
${BROWSER}    chrome
${DELAY}        10s

*** Test Cases ***
Valid LoginTest
    Given Login page is launched
    When User tomsmith login with password SuperSecretPassword!
    Then Should display success message
    
*** Keywords ***
Login page is launched
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${DELAY}

User ${username} login with password ${password}
    input text    id:username    ${username}
    input text    id:password    ${password}
    click button    css:button.radius
    
Should display success message
    Element Should Be Visible    xpath://div[@class='flash success']    