*** Settings ***
Resource        ../Base.robot

*** Variables ***
${EMAIL_INVALIDO}     email-invalido@teste.com
${SENHA_INVALIDA}     senha4567

*** Keywords ***
Dado que o usuário está na tela de login
    Wait Until Element Is Visible    id=com.example.vamsi.login:id/btnLogin    timeout=10s

Dado que possuo um usuário cadastrado
    Dado que o usuário está na tela de cadastro
    Quando o usuário preenche os campos de nome, telefone, email e senha
    E clica no botão de cadastrar
    Então o sistema deve criar o cadastro com sucesso
    Wait Until Element Is Visible  id=com.example.vamsi.login:id/btnGotoLogin
    Click Element    id=com.example.vamsi.login:id/btnGotoLogin

Quando o usuário insere o email válido e a senha válida
    Input Text    id=com.example.vamsi.login:id/etLogGmail          ${EMAIL_VALIDO}
    Input Text    id=com.example.vamsi.login:id/etLoginPassword     ${SENHA_VALIDA}
    Hide Keyboard

Quando o usuário insere um email inválido e uma senha inválida
    Input Text    id=com.example.vamsi.login:id/etLogGmail          ${EMAIL_INVALIDO}
    Input Text    id=com.example.vamsi.login:id/etLoginPassword     ${SENHA_INVALIDA}
    Hide Keyboard

E clica no botão de login
    Click Element    id=com.example.vamsi.login:id/btnLogin

Então o sistema deve permitir o acesso com sucesso
    Wait Until Page Contains    Login sucess

Então o sistema deve exibir uma mensagem de erro
    Wait Until Page Contains    Login error
