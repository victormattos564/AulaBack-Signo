# API de Gerenciamento de Usuários

Esta é uma API web construída com Node.js, Express e PostgreSQL para gerenciar usuários. A API permite a criação, leitura, atualização e exclusão (CRUD) de usuários em um banco de dados PostgreSQL.

## Configuração do Ambiente

Certifique-se de ter o Node.js e o PostgreSQL instalados em sua máquina.

Instale as dependências do projeto:

bash
npm init -y
npm install express pg
npm install -g nodemon


## Criando o Banco de Dados

Antes de iniciar o servidor, é necessário criar o banco de dados no PostgreSQL. Você pode fazer isso executando os comandos no console do PostgreSQL ou em uma ferramenta de administração:

Os comandos encontram-se dentro da pasta db, no arquivo script.sql.

### Aviso Importante

Os dados de acesso ao banco de dados estão expostos neste projeto, pois é destinado a fins educacionais como projeto de estudo para alunos. Certifique-se de não utilizar informações sensíveis neste contexto.

## Endpoints

- *POST /usuarios:* Adiciona um novo usuário.

  - Corpo da requisição: 
    json
    {
      "nome": "Nome do Usuário",
      "email": "email@exemplo.com"
    }
    

- *GET /usuarios:* Retorna todos os usuários.

  - Resposta: 
    json
    {
      "total": 3,
      "usuarios": [...]
    }
    

- *PUT /usuarios/:id:* Atualiza um usuário existente.

  - Parâmetros da URL: id do usuário.
  - Corpo da requisição: 
    json
    {
      "nome": "Novo Nome",
      "email": "novoemail@exemplo.com"
    }
    

- *DELETE /usuarios/:id:* Exclui um usuário existente.

  - Parâmetros da URL: id do usuário.

## Execução

Para iniciar o servidor, execute: 

bash
node nome-do-arquivo.js


O servidor será iniciado na porta especificada.

Certifique-se de substituir nome-do-arquivo.js pelo nome do arquivo onde o código está localizado.

## Testando as Rotas com Insomnia

Você pode usar o Insomnia para testar as rotas da API de Gerenciamento de Usuários. O Insomnia é uma ferramenta de teste de API que permite enviar solicitações HTTP para o seu servidor e visualizar as respostas.

### Configuração do Ambiente no Insomnia

1. Faça o download e instale o Insomnia.
2. Abra o Insomnia e crie um novo Workspace para o projeto.

### Adicionando as Requisições

1. Abra o Insomnia e crie uma nova Pasta para o projeto.
2. Adicione as requisições para cada rota da API:
   - *POST /usuarios:* Adicione uma requisição do tipo POST para criar um novo usuário. Configure o corpo da requisição com o JSON contendo os dados do usuário.
   - *GET /usuarios:* Adicione uma requisição do tipo GET para obter todos os usuários.
   - *GET /usuarios/:id:* Adicione uma requisição do tipo GET para obter um usuário específico. Substitua :id pelo ID do usuário desejado.
   - *PUT /usuarios/:id:* Adicione uma requisição do tipo PUT para atualizar um usuário existente. Substitua :id pelo ID do usuário que deseja atualizar e configure o corpo da requisição com os novos dados do usuário.
   - *DELETE /usuarios/:id:* Adicione uma requisição do tipo DELETE para excluir um usuário existente. Substitua :id pelo ID do usuário que deseja excluir.

### Testando as Requisições

Com as requisições adicionadas, você pode testá-las clicando no botão "Send" ao lado de cada requisição. Após enviar a requisição, o Insomnia exibirá a resposta do servidor, permitindo que você visualize o resultado da operação.