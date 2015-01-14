class CreateStudents < ActiveRecord::Migration
  def up
  	create_table(:students) do |t|
    t.string :f_name, null: false
    t.string :l_name, null: false
    t.string :tag, null: false
    t.timestamps 
    end  
  end

  def down
  	drop_table :students
 	end
end
