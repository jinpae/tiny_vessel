# == Schema Information
#
# Table name: forum_posts
#
#  id                  :integer          not null, primary key
#  title               :string
#  body                :text
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :integer
#  forum_replies_count :integer          default(0)
#
# Indexes
#
#  index_forum_posts_on_category_id  (category_id)
#  index_forum_posts_on_user_id      (user_id)
#

class ForumPost < ActiveRecord::Base
	default_scope { order(created_at: :desc) }

	scope :latest_posts, ->(n=10) { limit(n) }
	scope :general, -> { joins(:category).where(categories: { name: "General" }) }
	scope :front_end, -> { joins(:category).where(categories: { name: "Front-end" }) }
	scope :back_end, -> { joins(:category).where(categories: { name: "Back-end" }) }
	scope :design, -> { joins(:category).where(categories: { name: "Design" }) }
	scope :recent_posts_from, ->(user, n=5) { where(user_id: user.id).order(created_at: :desc).limit(n) }

  belongs_to :user
  belongs_to :category
	has_many :forum_replies

	validates :title, presence: true
	validates :body, presence: true
	validates :category_id, presence: true

	self.per_page = 20
end
