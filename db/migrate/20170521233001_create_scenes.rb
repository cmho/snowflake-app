class CreateScenes < ActiveRecord::Migration[5.0]
  def change
    create_table :scenes do |t|
      t.string :title
      t.integer :project_id
      t.string :description
      t.integer :character_id
      t.integer :projected_pages

      t.timestamps
    end
  end
end
