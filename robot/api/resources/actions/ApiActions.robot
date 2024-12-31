*** Settings ***
Resource       ../Base.robot

*** Keywords ***
Dado que eu tenho um CEP válido
    Set Test Variable    ${CEP}    01001-000

Dado que eu tenho um CEP inválido
    Set Test Variable    ${CEP}    99999-999

Dado que eu tenho um CEP incompleto
    Set Test Variable    ${CEP}    01001

Quando envio uma requisição para o CEP válido
    ${response}=    GET    ${BASE_URL}/${CEP}/json/    expected_status=Anything
    Set Global Variable    ${response}    ${RESPONSE}

Quando envio uma requisição para o CEP inválido
    ${response}=    GET    ${BASE_URL}/${CEP}/json/    expected_status=Anything
    Set Global Variable    ${response}    ${RESPONSE}

Quando envio uma requisição para um CEP incompleto
    ${response}=    GET    ${BASE_URL}/${CEP}/json/    expected_status=Anything
    Set Global Variable    ${response}    ${RESPONSE}

Então a API deve retornar status 200
    Status Should Be        200         ${RESPONSE}

Então a API deve retornar status 400
    Status Should Be    400        ${RESPONSE}

E o logradouro deve ser
    [Arguments]    ${expected_logradouro}
    Should Be Equal As Strings    ${RESPONSE.json()}[logradouro]   ${expected_logradouro}

E o DDD deve ser
    [Arguments]    ${expected_ddd}
    Should Be Equal As Strings    ${RESPONSE.json()}[ddd]   ${expected_ddd}

E a cidade deve ser
    [Arguments]    ${expected_localidade}
    Should Be Equal As Strings    ${RESPONSE.json()}[localidade]   ${expected_localidade}

E o bairro deve ser
    [Arguments]    ${expected_bairro}
    Should Be Equal As Strings    ${RESPONSE.json()}[bairro]   ${expected_bairro}

E a UF deve ser
    [Arguments]    ${expected_uf}
    Should Be Equal As Strings    ${RESPONSE.json()}[uf]   ${expected_uf}

E a mensagem de erro deve ser
    [Arguments]    ${expected_message}
    Should Be Equal As Strings    ${RESPONSE.json()}[erro]   ${expected_message}
