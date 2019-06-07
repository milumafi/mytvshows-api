class SeasonsController < ApplicationController
  #before_action :set_season, only: [:show, :update, :destroy]
  
  # GET /seasons
  def index
    @seasons = Season.all
    json_response(@seasons)
  end
    
end
