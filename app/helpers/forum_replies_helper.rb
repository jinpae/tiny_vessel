module ForumRepliesHelper
	def link_to_edit_forum_reply(forum_reply)
		if current_user? forum_reply.user
			link_to edit_forum_post_forum_reply_path(forum_reply.forum_post, forum_reply) do
				content_tag :i, nil, class: 'fa fa-pencil'
			end
		end
	end
end
