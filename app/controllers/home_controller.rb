class HomeController < ApplicationController
  def index
		if user_signed_in?
			redirect_to forum_posts_path
		end

		@latest_posts = ForumPost.latest_posts
  end
end
