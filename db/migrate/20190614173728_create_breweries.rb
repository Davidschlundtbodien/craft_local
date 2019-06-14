class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :email
      t.string :profile_img
      t.string :password_digest

      t.timestamps
    end
  end
end
