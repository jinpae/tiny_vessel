class UsersController < ApplicationController
  def show
		@user = User.friendly.find(params[:id])
		@recent_posts = ForumPost.recent_posts_from(@user)

		if request.path != user_path(@user)
			redirect_to @user, status: :moved_permanently
		end
  end
end
