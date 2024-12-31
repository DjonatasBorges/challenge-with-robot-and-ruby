*** Settings ***

Resource    ../resources/ApiResource.robot

*** Test Cases ***

Cenário: Consultar CEP válido
    [Documentation]    Como usuário, quero consultar um CEP válido na API e validar as informações retornadas.
    Quando envio uma requisição para o CEP válido
    Então a API deve retornar status 200
    E o logradouro deve ser    Praça da Sé
    E o DDD deve ser    11
    E a cidade deve ser    São Paulo
    E o bairro deve ser    Sé
    E a UF deve ser    SP

Cenário: Consultar CEP inválido
    [Documentation]    Como usuário, quero consultar um CEP inválido na API e validar que o erro é retornado.
    Quando envio uma requisição para o CEP inválido
    Então a API deve retornar status 200
    E a mensagem de erro deve ser    true

Cenário: Consultar CEP incompleto
    [Documentation]    Como usuário, quero consultar um CEP incompleto na API e validar o status retornado.
    Quando envio uma requisição para um CEP incompleto
    Então a API deve retornar status 400
