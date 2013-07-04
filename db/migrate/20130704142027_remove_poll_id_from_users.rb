class RemovePollIdFromUsers < ActiveRecord::Migration
  def change
	remove_column :users, :poll_id
  end
end
