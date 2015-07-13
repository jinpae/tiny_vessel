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
	default_scope { order(created_at: :desc) }

  belongs_to :user
  belongs_to :forum_post, counter_cache: true

	validates :body, presence: true
end
