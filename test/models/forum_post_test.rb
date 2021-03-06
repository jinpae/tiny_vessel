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
#  slug                :string
#
# Indexes
#
#  index_forum_posts_on_category_id  (category_id)
#  index_forum_posts_on_slug         (slug)
#  index_forum_posts_on_user_id      (user_id)
#

require 'test_helper'

class ForumPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
