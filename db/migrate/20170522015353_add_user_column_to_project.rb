class AddUserColumnToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :user_id, :integer, null: false
  end
end
