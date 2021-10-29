*** Settings ***
Library    OperatingSystem    

*** Variables ***
${outputDir}    ouputDirectory
${dircOne}    sourceDir
${dircTwo}    destDir
${file1}    index1.html


*** Keywords ***
Create a Base Dir
    Create Directory    ${outputDir}
    Should Exist    ${outputDir}    
    
Create source Dir
    ${direcPath}    Join Path    ${outputDir}  ${dircOne}      
    Create Directory     ${direcPath}
    Should Exist    ${direcPath}    

Create destination Dir
    ${direcPath}    Join Path    ${outputDir}  ${dircTwo}      
    Create Directory     ${direcPath}
    Should Exist    ${direcPath} 
    
Create File1
     ${filePath}=    Join Path    ${outputDir}  ${dircOne}    ${file1}
     Create File    ${filePath}    <h1>Content of File1</h1>
     should exist     ${filePath}
     

Move File from source to dest
    ${sourcePath}=    Join Path    ${outputDir}  ${dircOne}    ${file1}
    ${destPath}=    Join Path    ${outputDir}  ${dircTwo}    
    Move File    ${sourcePath}     ${destPath}
   
Copy File from source to dest
    ${sourcePath}=    Join Path    ${outputDir}  ${dircOne}    ${file1}
    ${destPath}=    Join Path    ${outputDir}  ${dircTwo}    
    Copy File    ${sourcePath}     ${destPath}
   
