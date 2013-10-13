class CreateRestrictions < ActiveRecord::Migration
  def change
    create_table :restrictions do |t|
      t.integer :poll_id
      t.integer :team_id

      t.timestamps
    end
  end
end
