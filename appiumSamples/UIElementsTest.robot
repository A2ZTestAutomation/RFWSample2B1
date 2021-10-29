*** Settings ***
Library    AppiumLibrary   
   

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}        11.0
${DEVICE_NAME}        emulator-5554
${APP}                    F:\\AndroidDemoApk\\ApiDemos-debug.apk 
${PACKAGE_NAME}         io.appium.android.apis

                   
*** Keywords ***
Open API Demo App
  Open Application   ${REMOTE_URL}
  ...     platformName=${PLATFORM_NAME}
  ...     platformVersion=${PLATFORM_VERSION}
  ...     deviceName=${DEVICE_NAME}
  ...     automationName=UiAutomator2
  ...     app=${APP}
  ...     newCommandTimeout=30000
  ...    packageName=${PACKAGE_NAME}
 
Open API DemoApp in Real Dev
   Open Application   http://localhost:4723/wd/hub
  ...     platformName=Android
  ...     platformVersion= 7.0
  ...     deviceName=LBFYHEPN7LGASKQS
  ...     newCommandTimeout=5000
  ...    app=${APP}

*** Test Cases ***
# Vertical Scroll Test
     # Open API DemoApp in Real Dev
     # # Swipe By Percent   10   50    10    30    1000  
  
     # sleep     3s
     # Element Should Be Visible    accessibility_id=Views    
     # Click Element    accessibility_id=Views 
     # sleep     2s
     # Repeat Keyword    2    Swipe By Percent   10   90    10    5    
     # # sleep     3s
     # Wait Until Page Contains Element    accessibility_id=Tabs        
     # Click Element    accessibility_id=Tabs

Horizontal Scroll Test
    Open API DemoApp in Real Dev
    Set Appium Timeout    10s
     Swipe By Percent   10   50    10    30    1000   
     sleep     3s
     Element Should Be Visible    accessibility_id=Views    
     Click Element    accessibility_id=Views 
    sleep     2s
    Repeat Keyword    2    Swipe By Percent   10   90    10    5    
     
     Wait Until Page Contains Element    accessibility_id=Seek Bar     
     Click Element    accessibility_id=Seek Bar

    click element     id=io.appium.android.apis:id/seek
   
    ${beforeTxt}=     Get Text    io.appium.android.apis:id/progress
    Log To Console    ${beforeTxt}    
      ${element_size}  Get Element Size    id=io.appium.android.apis:id/seek
     ${element_location}    Get Element Location    id=io.appium.android.apis:id/seek
     ${start_x}       Evaluate      ${element_location['x']}+ (${element_size['width']} *0.1)    #Get start point of seekbar.
     ${start_y}       Evaluate      ${element_location['y']}+ (${element_size['height']} * 0.1)  #Get vertical location of seekbar.
     ${end_x}         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.6)   #Get end point of seekbar.
    Swipe    ${start_x}     ${start_y}    ${end_x}        ${start_y} 
  
    ${afterTxt}=     Get Text    io.appium.android.apis:id/progress
    Log To Console    ${afterTxt}  

WebElements Test
    Open API DemoApp in Real Dev
     # Swipe By Percent   10   50    10    30    1000   
     sleep     2s
     Element Should Be Visible    accessibility_id=Views    
     Click Element    accessibility_id=Views  
     sleep     2s
     Click Element    accessibility_id=Controls
     sleep    2s
     Click element    accessibility_id=2. Dark Theme 
     sleep     2s
     input text      io.appium.android.apis:id/edit    Hello Welcome
      Hide Keyboard    
     Click element    accessibility_id=Checkbox 1
     Click element    accessibility_id=RadioButton 1
     Swipe By Percent   10   50    10    30    1000
     Click Element    id=io.appium.android.apis:id/toggle1
     Click Element    id=android:id/text1
     
     sleep    5s
     &{elements}=   Get Webelements    android:id/text1
     Click Element    ${elements}[2]
