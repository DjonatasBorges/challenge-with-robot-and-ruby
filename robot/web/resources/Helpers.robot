*** Settings ***
Documentation        Test Helpers

Resource    ../resource/Database.robot
Resource   ../resource/Base.robot

*** Keywords ***
Do Login
    [Arguments]        ${user}

    Go to Login Page
    Fill Credentials    ${user}
    Submit Credentials
    User Should Be Logged in    ${user}
