*** Settings ***
Library    RequestsLibrary
Library 	Collections
Library    JSONLibrary

*** Variables ***
${BaseURL}    http://thetestingworldapi.com/


*** Test Cases ***
TC_E2E_REQUEST

    Create Session    E2E    ${BaseURL}
    &{bodyPost}=    create dictionary  first_name=Arles    middle_name=Larissa    last_name=Robles    date_of_birth=01/01/1995
    &{header}=    create dictionary    Content-Type=application/json
    ${postResponse} =     post request     E2E   api/studentsDetails/     data=${bodyPost}    headers=${header}
    ${status} =    convert to string    ${postResponse.status_code}
    log to console    ${postResponse.status_code}
    log to console    "this is my future wife single name.."${postResponse.content}
    ${json_response}=    to json    ${postResponse.content}
    @{id_list}=    get value from json    ${json_response}    id
    ${id}=    get from list     ${id_list}    0
    log to console    "this is her id"${id}

    &{bodyPut}=    create dictionary  id=${id}    first_name=Arles    middle_name=Larissa    last_name=De Jimenez    date_of_birth=01/01/1995
    ${putResponse} =     put request     E2E   api/studentsDetails/${id}     data=${bodyPut}    headers=${header}
    ${status} =    convert to string    ${putResponse.status_code}
    log to console    ${putResponse.status_code}
    log to console    "this is the response of the update.."${putResponse.content}

    Fetch Details and Validate    ${id}

    ${deleteResponse} =     delete request     E2E   api/studentsDetails/${id}
    log to console       ${deleteResponse.status_code}
    log to console       ${deleteResponse.content}
     ${jsonDelete}=    to json   ${deleteResponse.content}
     @{messageResponse}=    get value from json    ${jsonDelete}    status
     ${status}=    get from list  ${messageResponse}  0
    should be equal    ${status}    true

*** Keywords ***
Fetch Details and Validate
    [Arguments]    ${id}
    ${getResponse} =     get request  E2E   api/studentsDetails/${id}
    log to console    "this is my future wife whencle she marries me.."${getResponse.content}
