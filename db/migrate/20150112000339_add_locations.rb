class AddLocations < ActiveRecord::Migration
  def up
  	create_table(:locations) do |t|
  		t.string :name
  		t.string :city, null: false
  		t.string :state, null: false
  		t.string :country, null: false
  		t.timestamps
  	end
  end

  def down
  	drop_table(:locations)
  end
end
