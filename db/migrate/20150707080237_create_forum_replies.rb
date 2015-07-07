class CreateForumReplies < ActiveRecord::Migration
  def change
    create_table :forum_replies do |t|
      t.text :body
      t.references :user, index: true
      t.references :forum_post, index: true

      t.timestamps null: false
    end
    add_foreign_key :forum_replies, :users
    add_foreign_key :forum_replies, :forum_posts
  end
end
