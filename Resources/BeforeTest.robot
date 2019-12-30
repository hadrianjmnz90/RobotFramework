*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Start Browser and Maximize
    Open Browser    https://www.thetestingworld.com/testings/    Firefox
    Maximize Browser Window

Close Browser Window
    ${title}=  Get Title
    Log    ${title}
    Close Browser
