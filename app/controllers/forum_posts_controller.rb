class ForumPostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_forum_post, except: [:index, :new, :create]

	def index
		@forum_posts = ForumPost.page(params[:page])
	end

	def show
		@forum_reply = ForumReply.new
	end

	def new
		@forum_post = ForumPost.new
	end

	def create
		@forum_post = current_user.forum_posts.new(forum_post_params)
		
		if @forum_post.save
			redirect_to @forum_post, notice: "New post created successfully."
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @forum_post.update(forum_post_params)
			redirect_to @forum_post, notice: "Post updated successfully."
		else
			render :edit
		end
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
