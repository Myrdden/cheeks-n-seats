class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to '/profile'
    else
      flash[:error] = 'Wrong email and/or password. Please try again.'
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = 'You are logged out.'
    redirect_to root_path
  end
end
