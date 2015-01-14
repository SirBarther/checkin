class ChangeCheckinsName < ActiveRecord::Migration
  def up
  	rename_table :usercheckins, :events
  end

  def down
  	rename_table :events, :usercheckins
  end
end
