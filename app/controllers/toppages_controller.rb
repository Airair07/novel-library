class ToppagesController < ApplicationController
  def index
    @episodes = Episode.order(created_at: :desc).page(params[:page])

    
    @new_novels = Novel.order(id: :desc).page(params[:page])
    
  end
end
