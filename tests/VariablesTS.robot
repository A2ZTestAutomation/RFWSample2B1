*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem    

*** Variables ***
${env}    test
&{url}    qa=https://www.demoblaze.com/    test=https://the-internet.herokuapp.com/login
*** Test Cases ***
Using list
    @{userDetails} =     Create List    John    Peter    Rosy    aaaa@gmail.com    234234
      
    Log Many   @{userDetails}   
    Log    "First Item : ",${userDetails}[1] 
    open browser    https://www.demoblaze.com/    chrome
    sleep    3s
    @{elements_list}   Get WebElements   css:h4.card-title a
    Log Many    @{elements_list}
    FOR    ${i}    IN    @{elements_list}
        ${elementText}    Get Text    ${i}  
        #${elementName} Get Element Attribute    ${i}    name
        Log To Console    ${elementText}
        Run Keyword If    '${elementText}' == 'Samsung galaxy s6'    Click Element    ${i}    
        Exit For Loop if    '${elementText}' == 'Samsung galaxy s6' 
   END
    Close Browser

Using Dictionary
    @{ints} =     Create List    30    40    50     
    &{dictItems} =    Create Dictionary    a=10    b=John    c=${30,40,50}
    Log     "Value of a",${dictItems.a}
    Log Many    "Value of c :",${dictItems}[c]
    Log     "Item in c",${dictItems}[c][1]
 
  
# Using EnvVariable
    # Log To Console    ${url.qa}    
     # Log To Console  Current User: %{OS}
     # Log To Console   %{JAVA_HOME}${/}javac
    # Open Browser    ${url.${env}}       chrome