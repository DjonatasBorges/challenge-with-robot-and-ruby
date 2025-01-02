Given('que eu tenho um CEP {string}') do |tipo|
  case tipo.downcase
  when 'válido'
    @cep = CepConstants::CEP_VALIDO
  when 'inválido'
    @cep = CepConstants::CEP_INVALIDO
  when 'incompleto'
    @cep = CepConstants::CEP_INCOMPLETO
  else
    raise "Tipo de CEP desconhecido: #{tipo}"
  end
end

When('envio uma requisição para o CEP') do
  @response = request_cep(@cep)
end

Then('a API deve retornar status {int}') do |status|
  expect(@response.code).to eq(status)
end

Then('a mensagem de erro deve ser {string}') do |erro|
  expect(@response['erro'].to_s).to eq(erro)
end

Then('a resposta da API deve conter os seguintes valores:') do |table|
  expected_values = table.raw[1..].to_h

  expected_values.each do |field, expected_value|
    actual_value = @response[field]
    expect(actual_value).to eq(expected_value), "Erro no campo '#{field}': esperado '#{expected_value}', obtido '#{actual_value}'"
  end
end