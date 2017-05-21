class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :sentence_summary
      t.text :paragraph_summary
      t.text :page_summary
      t.text :long_summary

      t.timestamps
    end
  end
end
