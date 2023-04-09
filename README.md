# ChatGPT APP - README

Este é um projeto feito apenas para testar a integração do ChatGPT em uma aplicação Rails.

## Requisitos
- docker
- docker compose

## Gerando uma api_key
Acesse o [site da openai](https://platform.openai.com/account/api-keys), crie uma conta, se ainda não tiver e gere uma api_key clicando na opção `Create new secret key`. Salve a key em um lugar seguro para utilizarmos ela na configuração mais a frente.

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
_Aguarde até a aplicação concluir as instalações e confirme que está funcionando._

**Passo 3:** Abra uma nova aba do terminal para gerarmos novas credentials

Primeiramente, acesse o container da aplicação
```
make shell
```

Agora vamos remover o `config/credentials.yml.enc` que está inutilizado, já que não temos o arquivo `config/master.key` no projeto e geramos eles novamente.
```
rm config/credentials.yml.enc
EDITOR="code --wait" rails credentials:edit
```

Em seguida vamos configurar nossas credentials adicionando a api_key do ChatGPT que geramos anteriormente. Para isso, vamos editar o `config/credentials.yml.enc` com o `nano` via terminal:
```bash
EDITOR=nano rails credentials:edit
```

Agora devemos adicionar:
```bash
openai:
  api_key: digite_a_api_key_aqui
```

_Obs: substitua "digite_a_api_key_aqui" pela key do ChatGPT gerada anteriormente. Para salvar o arquivo e fechar, podemos utilizar o atalho `Ctrl+X`_

**Passo 4:** Após salvar e fechar o nano, vamos reinciar a aplicação
Siga para a primeira aba do terminal, onde está rodando nossa aplicação e pare o serviço (`Ctrl+C`).
Agora vamos remover o que pode existir de "lixo" na aplicação e no docker
```
sudo make clean
```
_Obs: Se necessário pode confirmar pressionando o `y`_

Em seguida, vamos iniciar a aplicação
```
make up
```

Na segunda aba do terminal, vamos acessar o container da aplicação e rodar o foreman (para compilar o javascript e css)
```
make shell
bundle exec foreman start
```

**Passo 5:** Acessar e usar a aplicação
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

