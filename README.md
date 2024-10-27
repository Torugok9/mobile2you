# Projeto Rails - Sistema de Filmes

API desenvolvida em Ruby on Rails para upload de filmes, com suporte para upload de arquivo CSV e Resgate dos filmes cadastrados de maneira ordenada e filtrada.

### Pré-requisitos

- **Ruby** e **Rails** instalados.
- **Bundler** para gerenciar as dependências do projeto.

### Instalação

1. Instale as dependências do projeto:
   ```bash
   bundle install
   ```
2. Execute a criação e as migrações do banco:
  ```bash
  rails db:create
  rails db:migrate
  ```

3. Rode o projeto
  ```bash
  rails s
  ```

### ENDPOINTS

1. Upload do CSV de filmes: 

```bash
POST /api/v1/loadcsv/netflix
```

Parâmetros: 
  - arquivo CSV com informações dos filmes (chave do parâmetro: netflix).

2. Recuperar os filmes cadastrados de maneira ordenada ( por release_year ) ascendente: 
```bash
GET /api/v1/movies
```

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


  ### TESTES UNITÁRIOS

  Para rodar os testes:
  ```bash
  rails test
  ```


# Desafio lógica de programação

1. Dado um conjunto de caracteres, você precisará extrair os "diamantes" <> e as "areias" . da expressão, e no final exibir a quantidade de diamantes extraídos.

## Como Rodar o teste ? 

  ```bash
    ruby teste_diamante.rb 
  ```