class SessionsController < ApplicationController

	def index
	end	

	def sign_in
	end	

	def create
		@user = User.find_by(username: params[:username])
		if @user and @user.password = params[:password]
			session[:user_id] = @user.id
			flash[:notice] = "You are logged in"
			redirect_to user_path(@user.id)
		else 	
			flash[:alert] = "You are not logged in. Please try again."
			redirect_to sign_in_path
		end	
	end

	def destroy
		session[:user_id] == nil
		flash[:notice] = "You have logged out"
		redirect_to sessions_sign_in_path	
	end	

	def show
	end

end
