class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :project_id
      t.string :sentence_summary
      t.string :motifation
      t.string :goal
      t.string :conflict
      t.string :epiphany
      t.text :paragraph_summary
      t.text :long_synopsis
      t.text :additional_information

      t.timestamps
    end
  end
end
