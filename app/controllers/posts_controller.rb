class PostsController < ApplicationController
    
    def failure
    
    end

    def show
        # puts ">>>>> >>>> >>>> #{params[:id]}" see what paramerter is being sent through from the route
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end
       
    def create
        post = Post.new(post_params)
        if post.save
            redirect_to post_path(post)           
        else
            redirect_to new_post_path          
        end
    end

    private 
        def post_params
            params.require(:post).permit(:title,:blob,:author)
        end
end
