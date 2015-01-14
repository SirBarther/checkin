class RenameUsersToStudents < ActiveRecord::Migration
  def up
  	rename_column :events, :user_id, :student_tag
  end

  def down
  	rename_column :events, :student_tag, :user_id
  end
end
