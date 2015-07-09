class UpdateFieldsForUsers < ActiveRecord::Migration
  def self.up
		change_column_null :users, :username, true
		change_column_default :users, :username, nil
  end

	def self.down
		change_column_default :users, :username, ""
		change_column_null :users, :username, false
	end
end
