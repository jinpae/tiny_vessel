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

require 'test_helper'

class ForumReplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
