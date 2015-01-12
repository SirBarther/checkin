class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tag_id, :integer
  end
end
