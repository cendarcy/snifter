class PostsController < ApplicationController
	
  def index
    @posts = Post.where(:user_id => current_user.id)
  end

  def new
		@post = Post.new
	end	

	def create
		@post = Post.new(params[:posts])
		@post.save

		 if @post.save
    		redirect_to posts_path
  		else
    		render 'new'
 		 end
  	end	
	
	def show
		@post = Post.find(params[:id])
	end

	def edit
  		@post = Post.find(params[:id])
  	end	

	def update 
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :text))
 			redirect_to @post
		else
  		render 'edit'
		end
	end	

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end	

	private
	  def post_params
	    params.require(:post).permit(:title, :text)
	  end

end
