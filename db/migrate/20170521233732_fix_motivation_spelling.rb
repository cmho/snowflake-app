class FixMotivationSpelling < ActiveRecord::Migration[5.0]
  def change
    rename_column :characters, :motifation, :motivation
  end
end
