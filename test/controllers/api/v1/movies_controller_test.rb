# test/controllers/api/v1/movies_controller_test.rb
require 'test_helper'

module Api
  module V1
    class MoviesControllerTest < ActionDispatch::IntegrationTest
      test "Deve retornar os filmes ordenados pela data de lançamento" do
        get api_v1_movies_url, as: :json
        assert_response :success

        release_years = response.parsed_body.map { |movie| movie["release_year"].to_i }
        assert_equal release_years, release_years.sort, "Expected movies to be ordered by release_year"
      end

      test "Deve filtrar os filmes por gênero" do
        get api_v1_movies_url, params: { genre: "TV Show" }, as: :json
        assert_response :success

        movies = response.parsed_body
        movies = [movies]

        assert_equal 1, movies.size
        assert_equal "TV Show", movies.first["genre"]
      end

      test "Deve filtrar os filmes por Título" do
        get api_v1_movies_url, params: { title: "Movie One" }, as: :json
        assert_response :success

        movies = response.parsed_body
        movies = [movies]

        assert_equal 1, movies.size
        assert_equal "Movie One", movies.first["title"]
      end

      test "Deve filtrar os filmes pelo diretor" do
        get api_v1_movies_url, params: { director: "Martin Scorsese" }, as: :json
        assert_response :success

        movies = response.parsed_body
        movies = [movies]

        assert_equal 1, movies.size
      end

      test "Deve filtrar os filmes pelo ano de lançamento" do
        get api_v1_movies_url, params: { release_year: "2016" }, as: :json
        assert_response :success

        movies = response.parsed_body
        movies = [movies]

        assert_equal 1, movies.size
      end

      test "Deve filtrar os filmes por vários filtros ao mesmo tempo" do
        get api_v1_movies_url, params: { genre: "TV Show", release_year: "2014" }, as: :json
        assert_response :success

        movies = response.parsed_body
        movies = [movies]
        assert_equal 1, movies.size
        assert_equal "TV Show", movies.first["genre"]
      end
    end
  end
end