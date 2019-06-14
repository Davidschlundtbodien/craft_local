class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.integer :ibu
      t.integer :srm
      t.text :description
      t.string :glassware
      t.string :image
      t.integer :brewery_id

      t.timestamps
    end
  end
end
