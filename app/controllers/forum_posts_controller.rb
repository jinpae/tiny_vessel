class ForumPostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_forum_post, except: [:index, :new, :create]

	def index
		@forum_posts = ForumPost.all
	end

	def show
	end

	def new
		@forum_post = ForumPost.new
	end

	def create
		@forum_post = current_user.forum_posts.new(forum_post_params)
		
		if @forum_post.save
			redirect_to root_path, notice: "New post created successfully."
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def set_forum_post
			@forum_post = ForumPost.find(params[:id])
		end

		def forum_post_params
			params.require(:forum_post).permit(:title, :body, :category_id)
		end
end
