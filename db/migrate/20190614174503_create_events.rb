class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :scheduled_date
      t.string :location
      t.text :content
      t.string :image
      t.integer :brewery_id

      t.timestamps
    end
  end
end
