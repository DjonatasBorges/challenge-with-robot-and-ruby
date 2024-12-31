*** Settings ***
Documentation        Test Helpers

Resource   ../resources/Base.robot

*** Keywords ***
Dado que eu esteja logado
    ${user}                   Create Dictionary        user=Admin        password=admin123
    Dado que estou na tela de Login
    Quando eu informo um usuário e senha válidos
    E submeto o login
    Então devo ser autenticado e visualizar o Dashboard
