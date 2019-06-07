class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :update, :destroy]
  
  # GET /seasons
  def index
    @seasons = Season.all
    json_response(@seasons)
  end
   
  # POST /seasons
  def create
    @season = Season.create!(season_params)
    json_response(@season, :created)
  end
  
  # GET /seasons/:id
  def show
    json_response(@season)
  end
  
  # PUT /seasons/:id
  def update
    @season.update(season_params)
    head :no_content
  end
  
  # DELETE /seasons/:id
  def destroy
    @season.destroy
    head :no_content
  end
  
  private
  
  def season_params
    # whitelist params
    params.permit(:title, :plot)
  end
  
  def set_season
    @season = Season.find(params[:id])
  end

end
