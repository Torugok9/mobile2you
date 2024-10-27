module Api
  module V1
    class LoadCsvController < ApplicationController
      require 'csv'
      
      #POST /loadcsv/netflix_csv
      def netflix_csv
        if params[:netflix].nil? 
          puts "Parâmetros", params
          render json: {error: 'Nenhum arquivo enviado'}, status: :unprocessable_entity

          return
        end

        file = params[:netflix]

        unless file.content_type == 'text/csv'
          render json: {error: 'O formato do arquivo é inválido, por favor envie um arquivo .csv'}, status: :unprocessable_entity
        end

        CSV.foreach(file.path, headers: true) do |linha|
          # Primeiro eu verifico se já tem algum filme com o mesmo show_id
          filme = Movie.find_by(show_id: linha['show_id'])

          unless filme
            # Caso o filme não exista - cria um novo filme
            novo_filme = {
              show_id: linha['show_id'],
              genre: linha['type'],
              title: linha['title'],
              director: linha['director'],
              cast: linha['cast'],
              country: linha['country'],
              date_added: linha['date_added'],
              release_year: linha['release_year'],
              rating: linha['rating'],
              duration: linha['duration'],
              listed_in: linha['listed_in'],
              description: linha['description']
            }
  
            Movie.create(novo_filme)
          end
        end

        render json: {message: 'Arquivo importado sem problemas !'}, status: :ok
      end

    rescue => e
      render json: {error: "Ocorreu um erro ao tenta rprocessar o arquivo: #{e.message}"}, status: :internal_server_error
    end
  end
end