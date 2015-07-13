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

	def get_selected_category
		if action_name == 'index'
			'All Categories'
		else
			action_name.gsub('_', '-').capitalize
		end
	end

	def link_to_category(category)
		link_to category.name, [category.name.downcase.gsub('-', '_'), ForumPost]
	end
end
