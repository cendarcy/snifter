class UsersController < ApplicationController

	def index
		@user = User.all
	end	

	def sign_up
		@user = User.new
	end
	
	def create
		User.create(user_params)

		redirect_to users_path
	end

	def edit
		@user = User.find(params[:id])
				 	
	end

	def update
		@user = User.find(params[:id])
  		@user.update(user_params)

		
		redirect_to users_path

		# flash[:alert] = "Details have been changed"

	end		

	def show
		@user = User.find(params[:id])
		@posts = @user.posts

		respond_to do |format|
			format.html
		end	
	end

	private 
	def user_params
		params.require(:user).permit(:fname, :lname, :username, :password, :bday, :email)
	end	

end
