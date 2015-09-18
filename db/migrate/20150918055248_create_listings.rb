class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :mls
      t.string :address
      t.integer :price
      t.integer :sqft
      t.string :gui
      t.string :target

      t.timestamps null: false
    end
  end
end
