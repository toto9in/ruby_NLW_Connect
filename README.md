# Projeto Rails - Projetinho de Inscrições em eventos por referral

# Feito após ver as aulas de python da trilha NLW Connect da Rocketseat de fevereiro 2025

## Requisitos
Antes de rodar o projeto, certifique-se de ter instalado:
- ruby 3.3.6

## Instalação
1. Clone o repositório:
   ```sh
   git clone git@github.com:toto9in/ruby_NLW_Connect.git
   cd ruby_NLW_Connect
   ```
2. Instale as dependências do projeto:
   ```sh
   bundle install
   ```
3. Configure o banco de dados:
   ```sh
   rails db:create db:migrate
   ```
4. Inicie o servidor Rails:
   ```sh
   rails server
   ```

## Rotas Disponíveis

### Criar Evento
- **Rota:** `POST /event`
- **Controller:** `EventsController#create`
- **Descrição:** Cria um novo evento.

### Criar Assinante
- **Rota:** `POST /subscriber`
- **Controller:** `SubscribersController#create`
- **Descrição:** Cadastra um novo assinante em um evento.

### Listar Assinantes por Link
- **Rota:** `GET /subscriber/link/:link/event/:event_id`
- **Controller:** `SubscribersController#subscribers_by_link`
- **Descrição:** Retorna a lista de assinantes vinculados a um determinado link em um evento.

### Ranking de Links do Evento
- **Rota:** `GET /subscriber/ranking/event/:event_id`
- **Controller:** `SubscribersController#link_ranking`
- **Descrição:** Retorna o ranking de links mais utilizados para inscrições em um evento.

### Criar Link para Evento
- **Rota:** `POST /events_link`
- **Controller:** `EventsLinkController#create`
- **Descrição:** Gera um link de inscrição para um evento específico.


