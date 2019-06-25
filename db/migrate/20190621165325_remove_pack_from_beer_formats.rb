class RemovePackFromBeerFormats < ActiveRecord::Migration[5.2]
  def change
    remove_column :beer_formats, :pack, :integer
  end
end
