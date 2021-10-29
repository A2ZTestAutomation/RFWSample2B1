*** Settings ***
Library    AppiumLibrary   

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}        11.0
${DEVICE_NAME}        emulator-5554
${APP}        
${Activity_NAME}         com.android.calculator2.Calculator 
${PACKAGE_NAME}         com.android.calculator2
                   
# TabOpen - AppiumServer

*** Keywords ***
Open calculator in RealDev
  Open Application   http://localhost:4723/wd/hub  
  ...     platformName=Android
  ...     platformVersion= 7.0
  ...     deviceName=AlcatelTab
  ...     newCommandTimeout=3000
  ...     automationName=UiAutomator2
  ...    appPackage=com.tct.tablet.calculator
  ...    appActivity=com.tct.tablet.calculator.Calculator
  
Open calculator in Emulator
  Open Application   ${REMOTE_URL}
  ...     platformName=${PLATFORM_NAME}
  ...     platformVersion=${PLATFORM_VERSION}
  ...     deviceName=${DEVICE_NAME}
  ...     automationName=UiAutomator2
  ...     newCommandTimeout=3000
  ...     app =${APP}
  ...     appActivity=${Activity_NAME}
  ...     appPackage=${PACKAGE_NAME}
  
*** Test Cases ***
Calculator Test case
   Open calculator in RealDev
    Set Appium Timeout    30s
    Click Element    com.tct.tablet.calculator:id/tips_btn
     sleep    5s
    Click Element    id=com.tct.tablet.calculator:id/digit_6
    Click Element    id=com.tct.tablet.calculator:id/op_add
    Click Element    id=com.tct.tablet.calculator:id/digit_4
  
    Element Should Contain Text    	com.tct.tablet.calculator:id/result    10
    
 