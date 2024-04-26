
# Bem-vindo à API de Gerenciamento de Usuários!

Olá! Seja bem-vindo à nossa API de gerenciamento de usuários. Aqui, você poderá criar, visualizar, atualizar e excluir informações de usuários de forma fácil e rápida. Vamos dar uma olhada em como começar?

## Configurando o Ambiente

Antes de tudo, vamos garantir que você tenha tudo que precisa:

- Certifique-se de ter o Node.js e o PostgreSQL instalados na sua máquina.

Agora, vamos instalar as dependências do projeto. Basta abrir o terminal e executar estes comandos:

```bash
npm init -y
npm install express pg
npm install -g nodemon
```

## Preparando o Banco de Dados

Antes de ligar o servidor, vamos criar o banco de dados no PostgreSQL. Não se preocupe, é mais simples do que parece. Você pode seguir os comandos no console do PostgreSQL ou usar uma ferramenta de administração.

Os comandos necessários estão todos organizados dentro da pasta "db", no arquivo "script.sql". Fácil, não é mesmo?

### Um Aviso Importante

Ah, é importante mencionar que os dados de acesso ao banco de dados estão inclusos neste projeto. Não se preocupe, isso é apenas para fins educacionais, especialmente para alunos que estão estudando. Por favor, evite inserir informações sensíveis aqui.

## Explorando os Endpoints

Agora que temos tudo configurado, vamos dar uma olhada nos endpoints que nossa API oferece:

- **POST /usuarios:** Adiciona um novo usuário.

  - Aqui está como enviar a requisição:
    ```json
    {
      "nome": "Nome do Usuário",
      "email": "email@exemplo.com"
    }
    ```

- **GET /usuarios:** Retorna todos os usuários.

  - Você receberá algo assim como resposta:
    ```json
    {
      "total": 3,
      "usuarios": [...]
    }
    ```

- **GET /usuarios/:id:** Retorna um usuário específico.

- **PUT /usuarios/:id:** Atualiza um usuário existente.

  - Você só precisa enviar:
    ```json
    {
      "nome": "Novo Nome",
      "email": "novoemail@exemplo.com"
    }
    ```

- **DELETE /usuarios/:id:** Exclui um usuário existente.

## Hora de Rodar!

Estamos quase lá! Para iniciar o servidor, basta executar este comando:

```bash
node nome-do-arquivo.js
```

O servidor será iniciado na porta especificada. Lembre-se de substituir `nome-do-arquivo.js` pelo nome do arquivo onde está o código.

## Testando com Insomnia

Quer testar nossa API? O Insomnia é uma ferramenta incrível para isso!

### Como Configurar no Insomnia

1. Faça o download e instale o Insomnia.
2. Abra o Insomnia e crie um novo Workspace para o nosso projeto.

### Adicionando Requisições

1. Dentro do Insomnia, crie uma nova Pasta para o projeto.
2. Adicione as requisições para cada rota da API.

### Testando suas Requisições

Agora é só clicar em "Send" ao lado de cada requisição para testar. O Insomnia mostrará a resposta do servidor, permitindo que você veja o resultado das suas operações.

---
