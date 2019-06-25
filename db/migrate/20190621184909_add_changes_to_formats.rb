class AddChangesToFormats < ActiveRecord::Migration[5.2]
  def change
    rename_column :formats, :total_volume_oz, :single_unit_volume
    rename_column :formats, :type, :unit_type
    add_column :formats, :case, :integer
  end
end
