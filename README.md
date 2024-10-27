# Projeto Rails - Sistema de Filmes

Este projeto é uma API desenvolvida em Ruby on Rails para gerenciamento de filmes, com suporte para upload de arquivos CSV e diversos filtros para recuperação de dados.

## Rodar o Projeto

Para iniciar o projeto em sua máquina local, siga as instruções abaixo.

### Pré-requisitos

- **Ruby** e **Rails** instalados.
- **Bundler** para gerenciar as dependências do projeto.

### Instalação

1. Instale as dependências do projeto:
   ```bash
   bundle install
2. Execute a criação e as migrações do banco:
  ```bash
  rails db:create
  rails db:migrate
3. Rode o projeto
  ```bash
  rails s

### ENDPOINTS

1. Upload do CSV de filmes

# URL
POST /api/v1/loadcsv/netflix

Parâmetros: 
  - arquivo CSV com informações dos filmes (chave do parâmetro: netflix).

URL: GET /api/v1/movies

O endpoint de filmes também permite as filtragens através da seguinte forma: 
GET /api/v1/movies?parametro=valor

Parâmetros para filtrar : 
  •	genre
	•	title
	•	director
	•	cast
	•	country
	•	string
	•	date_added
	•	release_year
	•	rating
	•	duration
	•	listed_in
	•	description


  ### TESTES

  Para rodar os testes: 
    ```bash
    rails test
    

