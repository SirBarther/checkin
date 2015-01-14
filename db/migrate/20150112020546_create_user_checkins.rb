class CreateUserCheckins < ActiveRecord::Migration
  def up
    create_table :usercheckins do |t|
    	t.integer :user_id
    	t.integer :location_id
    	t.timestamps
    end
  end

  def down
  	drop_table :usercheckins
  end
end
