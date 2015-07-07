class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
      t.string :title
      t.text :body
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :forum_posts, :users
  end
end
