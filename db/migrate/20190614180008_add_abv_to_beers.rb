class AddAbvToBeers < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :abv, :decimal, precision: 5, scale: 2
  end
end
