class ChangeCheckinsName < ActiveRecord::Migration
  def up
  	rename_table :checkins, :events
  end

  def down
  	rename_table :events, :checkins
  end
end
