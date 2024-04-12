class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirect_to root_path, notice: 'Logged in successfully'
      render :logged, notice: 'Logged in successfully'
    else
      # redirect_to login_path
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
    puts "User: #{user.first_name} logged in successfully"
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'Logged out successfully'
  end
  
end