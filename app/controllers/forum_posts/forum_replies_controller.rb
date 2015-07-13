class ForumPosts::ForumRepliesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_forum_post
	before_action :set_forum_reply, except: [:create]

	def create
		@forum_reply = @forum_post.forum_replies.new(forum_reply_params)
		@forum_reply.user = current_user

		if @forum_reply.save
			redirect_to @forum_post, notice: 'New reply submitted successfully.'
		else
			set_forum_post
			render 'forum_posts/show'
		end
	end

	def edit
	end

	def update
		if @forum_reply.update(forum_reply_params)
			redirect_to @forum_post, notice: "Reply updated successfully."
		else
			render :edit
		end
	end

	def destroy
		@forum_reply.destroy

		redirect_to @forum_post, notice: 'Reply deleted successfully.'
	end

	private
		def set_forum_post
			@forum_post = ForumPost.find(params[:forum_post_id])
		end

		def set_forum_reply
			@forum_reply = @forum_post.forum_replies.find(params[:id])
		end

		def forum_reply_params
			params.require(:forum_reply).permit(:body)
		end
end
