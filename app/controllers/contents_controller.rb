class ContentsController < ApplicationController
  
  def index
    @movies = Movie.all.order(:created_at)
    @seasons = Season.all.order(:created_at)
    #json_response([@movies, @seasons])
  end
end
