class CreateEventBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :event_beers do |t|
      t.integer :event_id
      t.integer :beer_id

      t.timestamps
    end
  end
end
