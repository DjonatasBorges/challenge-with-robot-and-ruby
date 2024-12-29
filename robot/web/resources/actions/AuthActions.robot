*** Settings ***
Documentation        Authentication Actions

Library    Browser

Resource   ../Base.robot

*** Variables ***
${INPUT_EMAIL}    css=input[name="username"]
${INPUT_PASS}     css=input[name="password"]

*** Keywords ***
Go to Login Page
    Go To                      ${URL_BASE}
    Wait For Elements State    ${INPUT_EMAIL}        visible    5

Fill Credentials        
    [Arguments]             ${user}
    Fill Input Email        ${user}
    Fill Input Password     ${user}

Fill Input Email
    [Arguments]     ${user}
    Fill Text       ${INPUT_EMAIL}      ${user}[email]

Fill Input Password
    [Arguments]     ${user}    
    Fill Text       ${INPUT_PASS}       ${user}[password]



Submit Credentials
    Click              css=button[type="submit"] >> text=Entrar

User Should Be Logged In
    [Arguments]        ${user}

    ${element}              Set Variable    css=h6 >> text=Dashboard

    Wait For Elements State    ${element}    visible    5
