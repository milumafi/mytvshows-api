class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]
  
  # GET /movies
  def index
    @movies = Movie.all
    json_response(@movies)
  end
  
  # POST /movies
  def create
    @movie = Movie.create!(movie_params)
    json_response(@movie, :created)
  end
  
  # GET /movies/:id
  def show
    json_response(@movie)
  end
  
  # PUT /movies/:id
  def update
    @movie.update(movie_params)
    head :no_content
  end
  
  # DELETE /movies/:id
  def destroy
    @movie.destroy
    head :no_content
  end
  
  private
  
  def movie_params
    # whitelist params
    params.permit(:title, :plot)
  end
  
  def set_movie
    @movie = Movie.find(params[:id])
  end
end
