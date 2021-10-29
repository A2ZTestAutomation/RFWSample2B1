*** Settings ***
Library    SeleniumLibrary
# Test Teardown    Close Browser
*** Test Cases ***
# SelectFromRadioBtn
    # open browser    https://demo.seleniumeasy.com/basic-radiobutton-demo.html    chrome
    # Maximize Browser Window
    
    # Select Radio Button    optradio    Female
       # sleep     2s
       # Radio Button Should Be Set To    optradio    Female
    # ${gender}=     Get Element Attribute    optradio    value
    # Log To Console    ${gender}    
     # Radio Button Should Not Be Selected    optradio
     
SelectCheckBox
    Open Browser    https://demo.seleniumeasy.com/basic-checkbox-demo.html    chrome
    Maximize Browser Window
    sleep     2 s
    Select Checkbox    id:isAgeSelected
    Select Checkbox    class:cb1-element 
    Checkbox Should Be Selected    class:cb1-element 
    Select Checkbox    xpath:(//input[@class='cb1-element'])[3]
     Unselect Checkbox    class:cb1-element
    Checkbox Should Not Be Selected    class:cb1-element
    