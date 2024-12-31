*** Settings ***
Resource        ../resources/Base.robot

Test Setup      Abrir App
Test Teardown   Fechar App
Test Timeout    30 seconds


*** Test Cases ***
Cadastro de Usuário
    Dado que o usuário está na tela de cadastro
    Quando o usuário preenche os campos de nome, telefone, email e senha
    E clica no botão de cadastrar
    Então o sistema deve criar o cadastro com sucesso
