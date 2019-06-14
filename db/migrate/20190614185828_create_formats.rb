class CreateFormats < ActiveRecord::Migration[5.2]
  def change
    create_table :formats do |t|
      t.string :name
      t.string :type
      t.decimal :total_volume_oz, precision: 9, scale: 3

      t.timestamps
    end
  end
end
