# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
	def new_forum_reply_notification
		NotificationMailer.new_forum_reply_notification(User.first, ForumReply.last)
	end
end
