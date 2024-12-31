*** Settings ***
Resource        ../Base.robot

*** Variables ***
${USUARIO_VALIDO}     valid_user
${TELEFONE}           19 99999-9999
${msg_successful}    Registration Successful


*** Keywords ***
Dado que o usuário está na tela de cadastro
    Wait Until Element Is Visible    id=com.example.vamsi.login:id/tvRegister
    Click Element    id=com.example.vamsi.login:id/tvRegister

Quando o usuário preenche os campos de nome, telefone, email e senha
    Wait Until Element Is Visible    id=com.example.vamsi.login:id/etRegName
    Click Element    id=com.example.vamsi.login:id/etRegName
    Input Text    id=com.example.vamsi.login:id/etRegName           ${USUARIO_VALIDO}
    Input Text    id=com.example.vamsi.login:id/etRegPhone          ${TELEFONE}
    Input Text    id=com.example.vamsi.login:id/etRegGmail        ${EMAIL_VALIDO}
    Input Text    id=com.example.vamsi.login:id/etRegPassword       ${SENHA_VALIDA} 
    Hide Keyboard

E clica no botão de cadastrar
    Click Element    id=com.example.vamsi.login:id/btnRegLogin

Então o sistema deve criar o cadastro com sucesso
    Wait Until Page Contains    ${msg_successful}