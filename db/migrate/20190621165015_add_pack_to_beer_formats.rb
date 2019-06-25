class AddPackToBeerFormats < ActiveRecord::Migration[5.2]
  def change
    add_column :beer_formats, :pack, :integer
  end
end
