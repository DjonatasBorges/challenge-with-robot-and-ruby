
# Testes de API com Robot Framework e Requests Library

Este projeto utiliza o **Robot Framework** para testar APIs REST, com suporte à **Requests Library** para realizar as requisições HTTP.

---

### Pré-requisitos

Antes de começar, você precisa instalar os seguintes itens:

1. **Python** (versão 3.8 ou superior)
   - Para instalar o Python, siga as instruções para o seu sistema operacional:
     - [Download do Python](https://www.python.org/downloads/)

2. **Virtual Environment (venv)**
   - Recomenda-se usar um ambiente virtual para gerenciar as dependências do projeto, evitando conflitos globais.

---

### Instalação

1. **Crie e Ative um Ambiente Virtual**

   Crie um ambiente virtual para gerenciar as dependências:

   ```bash
   python -m venv venv
   ```

   Ative o ambiente virtual:

   - No Windows:
     ```bash
     venv\Scripts\activate
     ```
   - No macOS/Linux:
     ```bash
     source venv/bin/activate
     ```

2. **Instale as Dependências**

   Use o comando abaixo para instalar as dependências do projeto:

   ```bash
   pip install -r requirements.txt
   ```

---

### Como Executar os Testes

1. **Executar Todos os Testes**

   Para rodar todos os testes no diretório `tests/`, use o comando:

   ```bash
   robot tests/
   ```

   Após a execução, os relatórios serão gerados automaticamente na pasta `reports/`.

2. **Executar um Arquivo de Teste Específico**

   Para executar apenas um arquivo específico, use:

   ```bash
   robot tests/API.robot
   ```

3. **Gerar Relatórios em um Diretório Específico**

   Para salvar os relatórios em uma pasta diferente, use a flag `--outputdir`:

   ```bash
   robot --outputdir reports/ tests/
   ```

---

### Relatórios Gerados

Após a execução dos testes, três arquivos principais serão gerados na pasta especificada (por padrão `reports/`):

1. **`report.html`**: Relatório resumido com os resultados dos testes.
2. **`log.html`**: Log detalhado com informações de execução.
3. **`output.xml`**: Arquivo XML com os resultados no formato padrão do Robot Framework.

---

### Tecnologias Utilizadas

- **Python**: Linguagem principal do projeto.
- **Robot Framework**: Framework de automação usado para definir os casos de teste.
- **Requests Library**: Biblioteca para manipulação de requisições HTTP no Robot Framework.