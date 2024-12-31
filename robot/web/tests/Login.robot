*** Settings ***
Documentation        Login Test Suite

Resource         ../resources/Base.robot

Test Setup       Start Session
Test Teardown    After Test

*** Test Cases ***
Login efetuado com sucesso
    Dado que estou na tela de Login
    Quando eu informo um usuário e senha válidos
    E submeto o login
    Então devo ser autenticado e visualizar o Dashboard

Erro ao efetuar Login devido a erro de credenciais
    Dado que estou na tela de Login
    Quando eu informo um usuário e/ou senha inválidos
    E submeto o login
    Então Devo receber um alerta de "Invalid Credentials"
