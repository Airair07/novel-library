class ApplicationController < ActionController::Base

    include SessionsHelper

    private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_novels = user.novels.count {|novel| !novel.episodes.empty? }
    @count_likes = user.likes.count
  end
  
end
