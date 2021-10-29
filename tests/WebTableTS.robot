*** Settings ***
Library             SeleniumLibrary 
# Suite Teardown      Close Browser   

*** Variables ***
${URL}        https://demo.seleniumeasy.com/table-sort-search-demo.html
${BROWSER}    chrome

*** Test Cases ***
WebTableTest
       open browser    ${URL}    ${BROWSER}
       Maximize Browser Window
    
        ${rowCount}    Get Element Count    xpath://table[@id='example']/tbody/tr
        ${colCount}    Get Element Count    //table[@id='example']/thead/tr/th
        Log to console    "Number of Rows : ",${rowCount}
        Log To Console    "Number of Columns : ", ${colCount}    
        # To get particular cell value
        ${cellData}    Get Table Cell    xpath://table[@id='example']    4    3
        Log To Console    ${cellData}      
        
        # To chk a particular column header
        Table Column Should Contain    xpath://table[@id='example']    3    Office
        
        Table Row Should Contain    xpath://table[@id='example']    3    Tokyo    
               

        Table Cell Should Contain    xpath://table[@id='example']     6    3     San Francisco

        Table Should Contain    xpath://table[@id='example']    Regional Director  
        
        @{cityName}    Get WebElements    xpath://table[@id='example']/tbody/tr        
        
         FOR    ${i}    IN RANGE      1      ${rowCount}
            ${officeLoc}    Get Table Cell     xpath://table[@id='example']    ${i}    3
            Log To Console    ${officeLoc}    
        END
                  
          