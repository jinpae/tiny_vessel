# == Schema Information
#
# Table name: forum_posts
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
# Indexes
#
#  index_forum_posts_on_category_id  (category_id)
#  index_forum_posts_on_user_id      (user_id)
#

class ForumPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
	has_many :forum_replies

	validates :title, presence: true
	validates :body, presence: true
	validates :category_id, presence: true
end
