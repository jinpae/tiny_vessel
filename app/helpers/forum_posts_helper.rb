module ForumPostsHelper
	def get_author(post)
		user = post.user

		case
		when user.name.present?
			user.name
		when user.username.present?
			user.username
		else
			user.email
		end
	end
end
