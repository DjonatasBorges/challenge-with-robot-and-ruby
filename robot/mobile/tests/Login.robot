*** Settings ***
Resource        ../resources/Base.robot

Test Setup      Abrir App
Test Teardown   Fechar App
Test Timeout    30 seconds


*** Test Cases ***
Login com usuário válido
    Dado que possuo um usuário cadastrado
    Dado que o usuário está na tela de login
    Quando o usuário insere o email válido e a senha válida
    E clica no botão de login
    Então o sistema deve permitir o acesso com sucesso

Login com email e senha inválidos
    Dado que o usuário está na tela de login
    Quando o usuário insere um email inválido e uma senha inválida
    E clica no botão de login
    Então o sistema deve exibir uma mensagem de erro
