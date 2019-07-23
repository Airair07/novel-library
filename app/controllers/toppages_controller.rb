class ToppagesController < ApplicationController
  def index
    @novels = Novel.order(id: :desc).page(params[:page])
  end
end
