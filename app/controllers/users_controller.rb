class UsersController < ApplicationController
  def show
		@user = User.find(params[:id])
		@recent_posts = ForumPost.recent_posts_from(@user)
  end
end
