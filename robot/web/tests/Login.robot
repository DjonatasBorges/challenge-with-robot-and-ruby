*** Settings ***
Documentation        Login Test Suite

Resource         ../../resource/Base.robot


Test Setup       Start Session
Test Teardown    After Test

*** Test Cases ***
User Login

    [Tags]        smoke
    
    ${user}                   Create Dictionary        user=Admin        password=admin123
    
    Go to Login Page
    Fill Credentials        ${user}
    Submit Credentials
    User Should Be Logged In    ${user}

Incorrect Pass
    [Tags]    i_pass

    ${user}        Create Dictionary        user=teste        password=abcdef123

    Go to Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be    Usuário e/ou senha inválidos.
