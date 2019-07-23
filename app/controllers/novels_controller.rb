class NovelsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def show
    @novel = Novel.find_by(id: params[:id])
  end

  def new
    @novel = current_user.novels.build
  end

  def create
    @novel = current_user.novels.build(novel_params)
    if @novel.save
      flash[:success] = '小説を作成しました。'
      redirect_to @novel
    else
      flash.now[:danger] = '小説の作成に失敗しました。'
      render 'new'
    end
  end

  def destroy
    @novel.destroy
    flash[:success] = '小説を削除しました。'
    redirect_to user_path(current_user)
  end
  
  private

  def novel_params
    params.require(:novel).permit(:title, :story)
  end
  
  def correct_user
    @novel = current_user.novels.find_by(id: params[:id])
    unless @novel
      redirect_to root_url
    end
  end
  
end
