class CreateBeerFormats < ActiveRecord::Migration[5.2]
  def change
    create_table :beer_formats do |t|
      t.integer :beer_id
      t.integer :format_id

      t.timestamps
    end
  end
end
