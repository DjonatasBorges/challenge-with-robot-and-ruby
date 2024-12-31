*** Settings ***
Documentation        Admin Test Suite

Resource         ../resources/Base.robot

Test Setup       Start Session
Test Teardown    After Test

*** Test Cases ***
Cadastrar Novo ADMIN Com Sucesso
    Dado que eu esteja logado
    E estou na tela de "Admin"
    Quando eu adiciono um novo usuário com perfil “Admin” e status “Enabled”
    Então o sistema deve salvar o cadastro com sucesso
    E devo conseguir visualizar o novo usuário na lista de “System Users”

Falha Ao Cadastrar Novo ADMIN - Campos Obrigatórios
    Dado que eu esteja logado
    E estou na tela de "Admin"
    Quando eu tento cadastrar um usuário sem preencher campos obrigatórios
    Então o sistema deve exibir mensagens de erro indicando quais campos são requeridos

Falha Ao Cadastrar Novo ADMIN - Senhas Não Conferem
    Dado que eu esteja logado
    E estou na tela de "Admin"
    Quando tento cadastrar um usuário e preencho o "Password" e o "Confirm Password" de forma diferente
    Então o sistema deve exibir a mensagem de erro “Passwords do not match”

Buscar usuário ADMIN Cadastrado
    Dado que eu esteja logado
    E estou na tela de "Admin"
    E existe um usuário cadastrado
    Quando eu pesquiso por um ADMIN já cadastrado
    Então o resultado da busca deve exibir o usuário correspondente

Busca Sem Resultado Para ADMIN
    Dado que eu esteja logado
    E estou na tela de "Admin"
    Quando eu pesquiso por um Username que não existe
    Então o sistema deve indicar que nenhum registro foi encontrado

Apagar ADMIN Cadastrado
    Dado que eu esteja logado
    E estou na tela de "Admin"
    E existe um usuário cadastrado
    Quando eu opto por excluir esse usuário
    Então o sistema deve confirmar a remoção
    E o usuário não deve mais constar na lista
