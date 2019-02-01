class DashboardController < ApplicationController
  skip_before_action :require_valid_user!
  def show
    @posts = Post.all   
  end
end
