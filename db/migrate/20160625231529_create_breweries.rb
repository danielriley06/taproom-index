class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :city
      t.string :state
      t.text :notes
      t.integer :user_id
      t.float :latitude
      t.float :longitude
    end
  end
end
