*** Settings ***
Library  SeleniumLibrary
Library    SeleniumLibrary
#Resource    /home/adrianjimenez/PycharmProjects/Automation/Resources/BeforeTest.robot
Resource    ../Resources/BeforeTest.robot
Documentation    This test is for open login and close browser
Test Setup    Start Browser and Maximize
Test Teardown    Close Browser Window
*** Variables ***
${Browser}
${URL}

*** Test Cases ***
Register Form

    #Set Selenium Speed    1seconds
    Enter user, mail and pass    thisistheusername    thisistheemail    thisisthepassword

Choose Radio Button
  Select Radio Button    add_type    home    #para seleccionar un radio button hay un keyword especial
  #  Select Checkbox    terms
  #  Click Link    xpath=//a[text()='Read Detail']
    Select From List By Index    name:sex    2    #para seleccionar por indice en un dropdown
    #   capture page screenshot       /home/adrianjimenez/PycharmProjects/Automation/tc.png
   # press key    id:myid    \\13    #el 13 con los dos slashes significa el ascii value de la tecla enter
  #  open context menu  id=videos   with this command we can put the mouse on an element irs like right click on element
    #Close Browser

*** Keywords ***
Enter user, mail and pass
    [Arguments]    ${username}    ${email}    ${password}    #la palabra arguments tambien tiene que separarse al dar dos espacios
    Input Text    name=fld_username    ${username}        #el valor no lleva comillas ni simples ni dobles
    Input Text    xpath=//input[@type='email']    ${email}
    Input Text    name=fld_password    ${password}
