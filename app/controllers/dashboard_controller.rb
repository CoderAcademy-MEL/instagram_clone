class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    #@posts = Post.where(user_id: current_user.id)
    @posts = current_user.posts
  end
end
