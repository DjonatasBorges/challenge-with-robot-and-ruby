#language: pt
Funcionalidade: Consultar CEPs

  Cenário: Consultar CEP válido
    Dado que eu tenho um CEP "Válido"
    Quando envio uma requisição para o CEP
    Então a API deve retornar status 200
    E a resposta da API deve conter os seguintes valores:
    | campo       | valor           |
    | logradouro  | Praça da Sé     |
    | ddd         | 11              |
    | localidade  | São Paulo       |
    | bairro      | Sé              |
    | uf          | SP              |

  Cenário: Consultar CEP inválido
    Dado que eu tenho um CEP "Inválido"
    Quando envio uma requisição para o CEP
    Então a API deve retornar status 200
    E a mensagem de erro deve ser "true"

  Cenário: Consultar CEP incompleto
    Dado que eu tenho um CEP "Incompleto"
    Quando envio uma requisição para o CEP
    Então a API deve retornar status 400
