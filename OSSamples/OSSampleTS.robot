*** Settings ***
Library    OperatingSystem    
Resource     resource.robot

*** Test Cases ***
Create some Directories
        Create a Base Dir
        Create source Dir
        Create destination Dir
        
Create some Files
    Create File1
    
FileMgmtTest
    Copy File from source to dest