# == Schema Information
#
# Table name: forum_replies
#
#  id            :integer          not null, primary key
#  body          :text
#  user_id       :integer
#  forum_post_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_forum_replies_on_forum_post_id  (forum_post_id)
#  index_forum_replies_on_user_id        (user_id)
#

class ForumReply < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum_post, counter_cache: true

	validates :body, presence: true

	scope :recent_replies_from, ->(user, n=5) { where(user_id: user.id).order(created_at: :desc).limit(n) }

	def send_notifications
		users = forum_post.users.uniq + [forum_post.user] - [user]
		users.each do |user|
			NotificationMailer.new_forum_reply_notification(user, self).deliver_later
		end
	end
end
