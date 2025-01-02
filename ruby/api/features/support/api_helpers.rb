module ApiHelpers
    BASE_URL = 'https://viacep.com.br/ws'
  
    def request_cep(cep)
      HTTParty.get("#{BASE_URL}/#{cep}/json/")
    end
  end
  
  World(ApiHelpers)
  