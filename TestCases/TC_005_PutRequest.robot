*** Settings ***
Library    RequestsLibrary
Library 	Collections
Library    JSONLibrary

*** Variables ***
${BaseURL}    http://thetestingworldapi.com/
${id}    153545

*** Test Cases ***
TC_PUT_REQUEST

    Create Session    AddData    ${BaseURL}
    &{body}=    create dictionary  id=${id}    first_name=adrian    middle_name=EvenMoreDanger    last_name=Jimenez    date_of_birth=01/01/1990
    &{header}=    create dictionary    Content-Type=application/json
   ${response} =     put request     AddData   api/studentsDetails/${id}     data=${body}    headers=${header}
   ${status} =    convert to string    ${response.status_code}
   #should be equal   ${status}   200
   log to console    ${response.status_code}
   log to console    ${response.content}

*** Keywords ***

