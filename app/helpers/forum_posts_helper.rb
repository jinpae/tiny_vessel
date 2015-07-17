module ForumPostsHelper
	def get_author(post)
		user = post.user
		user.identity
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

	def link_to_edit_forum_post(forum_post)
		if current_user? forum_post.user
			link_to edit_forum_post_path forum_post do
				content_tag :i, nil, class: 'fa fa-pencil'
			end
		end
	end

	def render_reply_form
		if user_signed_in?
			render 'forum_posts/forum_replies/form'
		else
			content_tag :p, class: 'require-sign-in' do
				"Please #{content_tag :strong do
					link_to 'sign in', new_user_session_path
				end} to add a reply.".html_safe
			end
		end
	end
end
