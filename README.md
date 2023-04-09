# ChatGPT APP - README

Este é um projeto feito apenas para testar a integração do ChatGPT em uma aplicação Rails.

## Requisitos
- docker
- docker compose

## Gerando uma api_key
Acesse o [site da openai](https://platform.openai.com/account/api-keys), criei uma conta, se ainda não a tiver e gere uma api_key clicando na opção `Create new secret key`. Salve a key em um lugar seguro para utilizarmos ela na configuração mais a frente.

## Como instalar e rodar a aplicação
**Passo 1:** Baixar o projeto
```
git clone git@github.com:davide-almeida/chatgpt-app.git
```
**Passo 2:** Acessar o diretório raiz e rodar os containers
```
cd chatgpt-app
make up
```
Confirme se a aplicação está rodando no terminal e acessando o `localhost:3000`. Siga para o `Passo 3` apenas se estiver tudo funcionando até aqui.

**Passo 3:** Abra uma nova aba do terminal e rode o foreman
```
bundle exec foreman start
```

**Passo 4:** Acessar e usar a aplicação
Acesse o `localhost:3000` no navegador, atualize a página com o atalho `Ctrl+Shift+R`.
E agora já deve ser possível preencher os campos e clicar no botão `Enviar`. Utilize o `select` para alternar o retorno da API entre texto e imagem.

---

## Alguns comandos disponíveis no Makefile
| Comando | Descrição |
| --- | --- |
| `make up` | Inicia os containers com a aplicação |
| `make down` | Para os containers com a aplicação |
| `make shell` | Acessa o container Web |
| `sudo make clean` | Para os containers, exclui volumes e containers, remove o diretório `/tmp` da aplicação e o recria |

