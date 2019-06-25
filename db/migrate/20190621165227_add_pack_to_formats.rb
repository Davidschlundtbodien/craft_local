class AddPackToFormats < ActiveRecord::Migration[5.2]
  def change
    add_column :formats, :pack, :integer
  end
end
