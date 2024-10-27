module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: %i[ show update destroy ]
    
      # GET /movies
      # GET /movies.json
      def index
        filter_params = movie_filter_params

        @movies = Movie.where(filter_params).order("release_year")

        render formats: :json
      end
    
      # GET /movies/1
      # GET /movies/1.json
      def show
      end
    
      # POST /movies
      # POST /movies.json
      def create
        @movie = Movie.new(movie_params)
    
        if @movie.save
          render :show, status: :created
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /movies/1
      # PATCH/PUT /movies/1.json
      def update
        if @movie.update(movie_params)
          render :show, status: :ok
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /movies/1
      # DELETE /movies/1.json
      def destroy
        @movie.destroy!
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_movie
          @movie = Movie.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def movie_params
          params.require(:movie).permit(:show_id, :genre, :title, :director, :cast, :country, :string, :date_added, :release_year, :rating, :duration, :listed_in, :description)
        end

        def movie_filter_params
          params.permit(:genre, :title, :director, :cast, :country, :string, 
                        :date_added, :release_year, :rating, :duration, 
                        :listed_in, :description)
        end
    end
  end
end
