class CreatePitis < ActiveRecord::Migration
  def change
    create_table :pitis do |t|
      t.belongs_to :listing, index: true, foreign_key: true
      t.integer :price
      t.integer :down
      t.float   :interest
      t.integer :maturity
      t.float   :tax
      t.integer :insurance

      t.timestamps null: false
    end
  end
end
