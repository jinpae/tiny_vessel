class AddCategoryIdToForumPosts < ActiveRecord::Migration
  def change
    add_reference :forum_posts, :category, index: true
    add_foreign_key :forum_posts, :categories
  end
end
