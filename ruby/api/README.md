# Testes de API Ruby, Cucumber e RSpec

Este projeto contém testes de API para validar o funcionamento de endpoints de consulta de CEP. O framework utilizado é o **Cucumber**, com suporte ao **RSpec** para asserções e **HTTParty** para realizar as requisições HTTP.

---

### Pré-requisitos

Antes de começar, você precisa ter os seguintes itens instalados em sua máquina:

1. **Ruby** (versão 3.0 ou superior)
   - Para instalar o Ruby, siga as instruções para o seu sistema operacional:
     - [RubyInstaller para Windows](https://rubyinstaller.org/)
     - [Gerenciador rbenv para macOS/Linux](https://github.com/rbenv/rbenv)

2. **Bundler**
   - O Bundler é usado para gerenciar as dependências do projeto. 
   Ele já esta presente via instalador. Caso precise instalá-lo, execute:
     ```bash
     gem install bundler
     ```

---

### Instalação

1. **Instale as dependências**

   Use o Bundler para instalar todas as gems necessárias:

   ```bash
   bundle install
   ```

---

### Como Executar os Testes

1. **Executar todos os testes**

   Para rodar todos os cenários de teste, use o comando:

   ```bash
   cucumber
   ```

   Este comando executará todos os cenários definidos nos arquivos `.feature`.

2. **Gerar relatório HTML**

   Para gerar um relatório no formato HTML após a execução dos testes:

   ```bash
   cucumber --format html --out reports/report.html
   ```

   Após a execução, o relatório estará disponível no arquivo `reports/report.html`.

3. **Executar um cenário específico**

   Para executar um cenário específico, use a tag ou linha correspondente no arquivo `.feature`. Por exemplo:

   ```bash
   cucumber features/consultar_cep.feature
   ```

   Isso executará o cenário do arquivo `consultar_cep.feature`.

---

### Tecnologias Utilizadas

- **Ruby**: Linguagem principal do projeto.
- **Cucumber**: Framework para escrita de testes em formato BDD.
- **RSpec**: Utilizado para asserções nos steps.
- **HTTParty**: Biblioteca para fazer requisições HTTP.
- **Bundler**: Gerenciamento de dependências.