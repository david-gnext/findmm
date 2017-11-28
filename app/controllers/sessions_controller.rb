class SessionsController < ApplicationController

  def new
      session[:error] = nil
  end
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      session[:error] = nil
      redirect_to '/'
    else
      session[:error] = "Login Not Correct"
      render 'new'
    end
    end
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
