*** Settings ***
Library    RequestsLibrary
Library 	Collections
Library    JSONLibrary

*** Variables ***
${BaseURL}    http://thetestingworldapi.com/

*** Test Cases ***
TC_POST_REQUEST

    Create Session    AddData    ${BaseURL}
    &{body}=    create dictionary    first_name=adrian    middle_name=Danger    last_name=Jimenez    date_of_birth=01/01/1990
    &{header}=    create dictionary    Content-Type=application/json
   ${response} =     post request     AddData   api/studentsDetails    data=${body}    headers=${header}
   ${status} =    convert to string    ${response.status_code}
   #should be equal   ${status}   200
   log to console    ${response.status_code}
   log to console    ${response.content}

*** Keywords ***

