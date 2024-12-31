*** Settings ***
Documentation        Authentication Actions

Resource   ../Base.robot

*** Variables ***
${INPUT_USER}    css=input[name="username"]
${INPUT_PASS}     css=input[name="password"]

*** Keywords ***
Dado que estou na tela de Login
    Go To                      ${URL_BASE}
    Wait For Elements State    ${INPUT_USER}        visible    5

Quando eu informo um usuário e senha válidos
    ${user}                   Create Dictionary        user=Admin        password=admin123
    Fill Input Email        ${user}
    Fill Input Password     ${user}

Quando eu informo um usuário e/ou senha inválidos
    ${user}        Create Dictionary        user=teste        password=abcdef123
    Fill Input Email        ${user}
    Fill Input Password     ${user}

Fill Input Email
    [Arguments]     ${user}
    Fill Text       ${INPUT_USER}      ${user}[user]

Fill Input Password
    [Arguments]     ${user}    
    Fill Text       ${INPUT_PASS}       ${user}[password]


E submeto o login
    Click              css=button[type="submit"]

Então devo ser autenticado e visualizar o Dashboard
    ${element}              Set Variable    css=h6 >> text=Dashboard

    Wait For Elements State    ${element}    visible    20

Então devo receber um alerta de "Invalid Credentials"
    ${element}                Set Variable    css=p >> text=Invalid Credentials
