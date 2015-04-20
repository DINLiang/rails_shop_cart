class CreateCartLists < ActiveRecord::Migration
  def change
    create_table :cart_lists do |t|
      t.string :sort
      t.string :name
      t.float  :price
      t.string :unit
      t.integer :count
      t.float  :sum
      t.integer :shop_list_id

      t.timestamps
    end
  end
end
