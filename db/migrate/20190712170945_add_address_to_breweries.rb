class AddAddressToBreweries < ActiveRecord::Migration[5.2]
  def change
    add_column :breweries, :address, :string
  end
end
