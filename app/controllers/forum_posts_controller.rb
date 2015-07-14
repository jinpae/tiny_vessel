class ForumPostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :require_correct_user, only: [:edit, :update, :destroy]
	before_action :set_forum_post, only: [:show]
	before_action :set_q, except: [:show, :new, :create, :edit, :update, :destroy]

	def index
		@forum_posts = paginate @q.result(distinct: true)
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

	def general
		@forum_posts = paginate ForumPost.general
		render :index
	end

	def front_end
		@forum_posts = paginate ForumPost.front_end
		render :index
	end

	def back_end
		@forum_posts = paginate ForumPost.back_end
		render :index
	end

	def design
		@forum_posts = paginate ForumPost.design
		render :index
	end

	private
		def set_forum_post
			@forum_post = ForumPost.find(params[:id])
		end

		def forum_post_params
			params.require(:forum_post).permit(:title, :body, :category_id)
		end

		def set_q
			@q = ForumPost.search(params[:q])
		end

		def paginate(posts)
			posts.page(params[:page])
		end

		def require_correct_user
			set_forum_post
			super @forum_post
		end
end
