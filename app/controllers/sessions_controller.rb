class SessionsController < ApplicationController
  skip_before_action :require_valid_user!, except: [:destroy]
  
  def new
   
  end

  def show
    @user = User.find(params[:id])
    # session[:user_id] = @user.id  
    session[:username] = @user.username 
    # sputs ">>>> #{@user.username}"
  end

  def create
    reset_session
    @user = User.find_by(username: session_params[:username])
    
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id  
      session[:username] = @user.username   
      flash[:success] = 'Welcome back!'
      redirect_to root_path
    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
    reset_session
  end

  def edit
    @user = User.find(params[:id])
    # puts ">>>>>>> #{@user.username}<<<<<<"
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def session_params
    params.require(:session).permit(:username, :password)
  end
end