class AddDefaultToRestrictedInPolls < ActiveRecord::Migration
  def change
	change_column :polls, :restricted, :boolean, default: false
  end
end
