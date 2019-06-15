class ContentsController < ApplicationController
  before_action :set_user, only: [:index, :create]
  
  # GET /users/:user_id/contents
  def index
    json_response(@user.contents.where(created_at: 2.days.ago..DateTime::Infinity.new).order(:created_at))
  end
  
  # POST /users/:user_id/contents
  def create    
    #Check if content exists into databae as movie or season
    if Movie.where(title: params[:title]).exists?
      @content_type = 'movie'
      @content_id = Movie.where(title: params[:title]).first.id
    elsif Season.where(title: params[:title]).exists?
      @content_type = 'season'
      @content_id = Season.where(title: params[:title]).first.id
    else
      render json:{ error: 'this title does not exists into database as movie or season, try with another content' }, status: :no_content
      return
    end
   
    # Check if content is already purchased for the user
    if @user.contents.where(created_at: 2.days.ago..DateTime::Infinity.new, content_type: @content_type, content_id: @content_id).exists?
      render json: { error: 'this content is already purchased, you cannot purchase it again right now' }, status: :bad_request 
      return
    else
      #if not purchase the content and insert into database
      @content = @user.contents.new do |c|
        c.content_type = @content_type
        c.content_id = @content_id
        c.video_quality = params[:video_quality]
        c.price = params[:price]
      end
      @content.save
      json_response(@content, :created)
    end
  end
  
  # GET /contents
  def show
    @movies = Movie.all.order(:created_at)
    @seasons = Season.all.order(:created_at)
    #json_response([@movies, @seasons])
  end
  
  private
  
  def set_user
    @user = User.find(params[:user_id])
  end
end
