*** Settings ***
Library               Collections
Library               RequestsLibrary

*** Variables ***
${BASE_URL}           https://viacep.com.br/ws
${CEP_VALIDO}         01001000
${CEP_INVALIDO}       00000000
${RESPONSE}           ''

*** Keywords ***

# -------------------- Keywords de Teste --------------------

Quando envio uma requisição para o CEP válido
    ${response}=    GET    ${BASE_URL}/${CEP_VALIDO}/json/    expected_status=Anything
    Set Global Variable    ${response}    ${RESPONSE}

Quando envio uma requisição para o CEP inválido
    ${response}=    GET    ${BASE_URL}/${CEP_INVALIDO}/json/    expected_status=Anything
    Set Global Variable    ${response}    ${RESPONSE}

Quando envio uma requisição para um CEP incompleto
    ${response}=    GET    ${BASE_URL}/12345/json/    expected_status=Anything
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
