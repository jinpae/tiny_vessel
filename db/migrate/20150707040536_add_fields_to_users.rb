class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string, null: false, default: ""
    add_column :users, :bio, :text
    add_column :users, :twitter_id, :string
    add_column :users, :github_id, :string
    add_column :users, :linkedin_id, :string
    add_column :users, :website_url, :string
    add_column :users, :admin, :boolean, default: false

		add_index :users, :username, unique: true
  end
end
