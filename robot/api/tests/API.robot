*** Settings ***

Resource    ../resources/Base.robot

*** Test Cases ***

Cenário: Consultar CEP válido
    Dado que eu tenho um CEP válido
    Quando envio uma requisição para o CEP válido
    Então a API deve retornar status 200
    E o logradouro deve ser    Praça da Sé
    E o DDD deve ser    11
    E a cidade deve ser    São Paulo
    E o bairro deve ser    Sé
    E a UF deve ser    SP

Cenário: Consultar CEP inválido
    Dado que eu tenho um CEP inválido
    Quando envio uma requisição para o CEP inválido
    Então a API deve retornar status 200
    E a mensagem de erro deve ser    true

Cenário: Consultar CEP incompleto
    Dado que eu tenho um CEP incompleto
    Quando envio uma requisição para um CEP incompleto
    Então a API deve retornar status 400
