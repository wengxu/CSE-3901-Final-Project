class SessionsController < ApplicationController
  def new
  end
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		#we log into the correct user and go to their profile
  		log_in user
  		redirect_to user
  	else
  		#we create a nice little error message
  		flash[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end
  def destroy
  	log_out
  	redirect_to search_path
  end
end
