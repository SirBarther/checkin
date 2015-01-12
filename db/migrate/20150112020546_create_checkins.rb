class CreateCheckins < ActiveRecord::Migration
  def up
    create_table :checkins do |t|
    	t.integer :location_id
    	t.integer :user_id
    	t.timestamps
    end
  end

  def down
  	drop_table :checkins
  end
end
