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
			content_tag :div, class: 'require-sign-in' do
				link_to 'Sign in to Reply', new_user_session_path, class: 'btn btn-md'
			end
		end
	end

	def markdown(content)
		context = {
			gfm: true,
			asset_root: 'https://a248.e.akamai.net/assets.github.com/images/icons'
		}

		pipeline = HTML::Pipeline.new [
			HTML::Pipeline::MarkdownFilter,
			HTML::Pipeline::SanitizationFilter,
			HTML::Pipeline::EmojiFilter
		], context

		result = pipeline.call(content)
		result[:output].to_s.html_safe
	end
end
