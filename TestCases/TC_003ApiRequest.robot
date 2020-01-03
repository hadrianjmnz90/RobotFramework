*** Settings ***
Library    RequestsLibrary
Library	Collections
Library    JSONLibrary

*** Variables ***
${BaseURL}    http://thetestingworldapi.com/
#${BaseURL}    https://reqres.in/
${studentID}    153545

*** Test Cases ***
TC_GET_REQUEST

    Create Session    GetStudentDetails    ${BaseURL}
    ${getResponse}=    Get Request     GetStudentDetails    api/studentsDetails/${studentID}
    log to console   ${getResponse}

TC_Fetch_StudentDetails_ById

    Create Session    FetchData    ${BaseURL}
    #&{param}=    create dictionary    page=2
   ${response} =     get request  FetchData   api/studentsDetails/${studentID}
   ${codeString} =    convert to string    ${response.status_code}
   #should be equal   ${codeString}   200
   log to console    ${response.status_code}
   log to console    ${response.content}

*** Keywords ***