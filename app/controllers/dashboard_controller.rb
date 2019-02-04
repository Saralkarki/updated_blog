class DashboardController < ApplicationController
  skip_before_action :require_valid_user!
  def show   
    @posts = Post.all  
  
  end

  def user
    @user = User.all
    @username = User.find_by(username: user_params[:username])
   


  private 
    def user_params
      params.require(:user).permit(:username)
    end
  end
end
