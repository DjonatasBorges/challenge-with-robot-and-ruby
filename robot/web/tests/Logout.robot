*** Settings ***
Documentation        Logout Test Suite

Resource         ../resources/Base.robot

Test Setup       Start Session
Test Teardown    After Test

*** Test Cases ***
Logout efetuado com sucesso
    Dado que eu esteja logado
    Quando clico sobre a foto e/ou nome do usuário para abrir o menu do usuário
    E efetuo o "Logout"
    Então sou redirecionado a página de login
