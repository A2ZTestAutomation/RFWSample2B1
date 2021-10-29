*** Settings ***
Library    SeleniumLibrary    
Library    AxeLibrary    


*** Test Cases ***
Sample A11YTest
    open browser        https://www.selenium.dev/    chrome
    &{resutls}    Run Accessibility Tests    selPageA11yReport.json
    Log To Console    Violations Count : ${resutls.violations}    
    Log Readable Accessibility Result    violations
    Get Json Accessibility Result