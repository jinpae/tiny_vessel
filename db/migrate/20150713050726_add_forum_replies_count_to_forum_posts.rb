class AddForumRepliesCountToForumPosts < ActiveRecord::Migration
  def change
    add_column :forum_posts, :forum_replies_count, :integer, default: 0
  end
end
