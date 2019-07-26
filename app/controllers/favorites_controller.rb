class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    novel = Novel.find(params[:novel_id])
    current_user.favorite(novel)
    flash[:success] = 'お気に入りに追加しました'
    redirect_back(fallback_location: likes_user_path(current_user))
  end

  def destroy
    novel = Novel.find(params[:novel_id])
    current_user.unfavorite(novel)
    flash[:success] = 'お気に入りを解除しました'
    redirect_back(fallback_location: likes_user_path(current_user))
  end
end
