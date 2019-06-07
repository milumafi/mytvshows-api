class EpisodesController < ApplicationController
  before_action :set_season
  before_action :set_season_episode, only: [:show, :update, :destroy]
  
  # GET /seasons/:season_id/episodes
  def index
    json_response(@season.episodes)
  end
  
  # GET /seasons/:season_id/episodes/:id
  def show
    json_response(@episode)
  end
  
  # POST /seasons/:season_id/episodes
  def create
    @season.episodes.create!(episode_params)
    json_response(@season, :created)
  end
  
  # PUT /seasons/:season_id/episodes/:id
  def update
    @episode.update(episode_params)
    head :no_content
  end
  
  # DELETE /seasons/:season_id/episodes/:id
  def destroy
    @episode.destroy
    head :no_content
  end
  
  private
  
  def episode_params
    params.permit(:title,:plot)
  end
  
  def set_season
    @season = Season.find(params[:season_id])
  end
  
  def set_season_episode
    @episode = @season.episodes.find_by!(id: params[:id]) if @season
  end
end