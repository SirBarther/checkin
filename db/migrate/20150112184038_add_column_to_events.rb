class AddColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :tag_id, :integer
  end
end
