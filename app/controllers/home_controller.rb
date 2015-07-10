class HomeController < ApplicationController
  def index
		@latest_posts = ForumPost.latest_posts
  end
end
