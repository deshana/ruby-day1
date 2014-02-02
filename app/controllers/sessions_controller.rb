class SessionsController < ApplicationController
  def new
  end

  def create
  	user =User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to user, notice:"logged in !"
  		else
  			flash[:error]="Wrong password or email"
  			redirect_to root_url
  	end

  end

  def destroy
  	session[:user_id]=nil
  	redirect_to sessions_new_path, notice:"logged out!!"
  end
end