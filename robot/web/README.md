
# Testes de Aplicação Web com Robot Framework e Browser Library

Este projeto utiliza o **Robot Framework** para testar aplicações web, com suporte à **Browser Library**, que utiliza o **Playwright** para automação de navegadores modernos.

---

### Pré-requisitos

Antes de começar, você precisa instalar os seguintes itens:

1. **Python** (versão 3.8 ou superior)
   - Para instalar o Python, siga as instruções para o seu sistema operacional:
     - [Download do Python](https://www.python.org/downloads/)

2. **Virtual Environment (venv)**
   - Recomenda-se usar um ambiente virtual para gerenciar as dependências do projeto, evitando conflitos globais.

3. **Node.js**
   - A **Browser Library** depende do **Playwright**, que requer o Node.js. Instale o Node.js no seu sistema:
     - [Download do Node.js](https://nodejs.org/)

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

3. **Instale as Dependências do Projeto**

   Use o comando abaixo para instalar as dependências do projeto:

   ```bash
   pip install -r requirements.txt
   ```

4. **Instale as dependências Node**

   Após instalar as dependências do python, instale as dependências node:

   ```bash
   rfbrowser init
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
   robot tests/Login.robot
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
- **Browser Library**: Biblioteca para automação de navegadores baseada no Playwright.