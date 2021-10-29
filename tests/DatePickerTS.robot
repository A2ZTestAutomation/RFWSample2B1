*** Settings ***
Library    SeleniumLibrary    

*** Test Cases ***
Select DatefromCal
    Open Browser    https://demoqa.com/date-picker    chrome
    Maximize Browser Window
    click element    id:datePickerMonthYearInput
    Execute Javascript    window.scrollTo(0, 300)
    Click Prev Month
    Click Next Month
    click Element     xpath://div[@class='react-datepicker__month']//div[5]//div[2]
    ${selectedDate}    Get Element Attribute       id:datePickerMonthYearInput    value
    Should Be Equal As Strings    ${selectedDate}    10/25/2021        

Select Date Using JSExec
    Open Browser    https://demoqa.com/date-picker    chrome
    Maximize Browser Window
    Execute Javascript     document.querySelector('#datePickerMonthYearInput').value='09/25/2021'
    

*** Keywords ***
Click Prev Month
    Wait Until Element Is Visible    xpath://button[@class='react-datepicker__navigation react-datepicker__navigation--previous']
    Click Element     xpath://button[@class='react-datepicker__navigation react-datepicker__navigation--previous']
    
Click Next Month
    Wait Until Element Is Visible    xpath://button[@class='react-datepicker__navigation react-datepicker__navigation--next']    
    Click element    xpath://button[@class='react-datepicker__navigation react-datepicker__navigation--next']
    

    