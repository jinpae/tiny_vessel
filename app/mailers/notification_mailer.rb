class NotificationMailer < ApplicationMailer
	add_template_helper(UsersHelper)
	add_template_helper(ForumPostsHelper)

	def new_forum_reply_notification(user, forum_reply)
		@user = user
		@forum_reply = forum_reply

		mail(
			to: user.email,
			from: "notifications@tinyvessel.com",
			subject: "[Tiny Vessel] New reply in #{forum_reply.forum_post.title}"
		)
	end
end
