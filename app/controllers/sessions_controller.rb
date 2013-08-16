class SessionsController < ApplicationController
  def new
    render :new
  end
  
  def create
    user = User.find_by_name(params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome Back"
      login(user)
      redirect_to user
    else
      flash.now[:fail] = "Incorrect password or username"
      render :new
    end
  end
  
  def destroy
    logout
    flash[:success] = "Logged out"
    redirect_to new_session_url
  end
end
