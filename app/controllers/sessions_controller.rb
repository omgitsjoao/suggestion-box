class SessionsController < ApplicationController

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to suggestions_url
    else
      flash[:notice] = 'Make sure the user exists and the password is correct'
      redirect_to login_path
    end
  end

  # Method that logs out the user
  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to suggestions_url
  end
end
