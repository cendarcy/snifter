class UsersController < ApplicationController
	def index
		@users = User.all
	end	

	def new
		@user = User.new
	end
	
	def create
		User.create(fname: params[:user][:fname], 
			lname: params[:user][:lname], 
			bday: params[:user][:bday], 
			email: params[:user][:email])

		redirect_to users_path
	end
end
