class HomeController < ApplicationController
    skip_before_action :require_valid_user!, only: [:index]

    def index       
        @post = Post.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
        # @post_id = Post.find(params[:id]) 
        if session[:user_id] 
            @user_id = current_user.posts.all
        end
    end
  
end
