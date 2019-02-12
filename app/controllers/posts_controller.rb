class PostsController < ApplicationController
    skip_before_action :require_valid_user!, only: [:index,:show]

    def failure
    
    end

    def index
        @post = Post.all
        if session[:user_id] 
            @user_id = current_user.posts.all
        end
        
        # puts ">>>>#{Post.where(title:"saral")}"
    end

    def show
        @post = Post.find(params[:id]) 
        @user_id = current_user.posts.all 
        puts ">>>> #{@post.id}"     
    end

    def new
        @post = current_user.posts.build       
    end

    def create
        post = current_user.posts.build(post_params)
        if post.save
            redirect_to post_path(post)           
        else
            flash[:error] =   "could not save"
            redirect_to new_post_path          
        end
    end

    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to @post
          else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
            redirect_to root_path
    end

    
    private 
        def post_params
            params.require(:post).permit( :title , :blob)
        end
   

     
end
