class Addratings < ActiveRecord::Migration
  def change
    add_column :breweries, :rating, :integer
  end
end
