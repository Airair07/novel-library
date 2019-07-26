class EpisodesController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def show
    @episode = Episode.find_by(id: params[:id])
  end

  def new
    @novel = current_user.novels.find_by(id: params[:id])
    @episode = @novel.episodes.build
  end

  def create
    @novel = current_user.novels.find_by(id: params[:id])
    @episode = @novel.episodes.build(episode_params)
    if @episode.save
      flash[:success] = '本文を投稿しました。'
      redirect_to @episode
    else
      flash.now[:danger] = '本文の投稿に失敗しました。'
      render 'new'
    end
  end

  def destroy
    @episode.destroy
    flash[:success] = '小説を削除しました。'
    redirect_to @novel
  end
  
   private

  def episode_params
    params.require(:episode).permit(:subtitle, :number, :text)
  end
  
  def correct_user
    @episode = Episode.find_by(id: params[:id])
    @novel = current_user.novels.find_by(id: @episode.novel)
    unless @novel
      redirect_to root_url
    end
  end
  
end
