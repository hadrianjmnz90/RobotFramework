*** Settings ***
Library  SeleniumLibrary
#Resource    /home/adrianjimenez/PycharmProjects/Automation/Resources/BeforeTest.robot
Resource    ../Resources/BeforeTest.robot
Documentation    This test is for open login and close browser
Test Setup    Start Browser and Maximize
Test Teardown    Close Browser Window
*** Variables ***
#${Browser}
#${URL}

*** Test Cases ***
Test
    ${PageTitle}=    get title
    Log     ${PageTitle}
    ${value}=    get value    xpath://input[@type="submit"]
    log    ${value}
    #Select From List By Index    id:countryId    2
    #${countryName}=    Get Selected List Label    id:countryId
    #log to console     ${countryName}
    #${allCountries}  Get List Items    id:countryId
    #log to console    ${allCountries}
     ${currentURL}    get location
     log to console    ${currentURL}
*** Keywords ***

