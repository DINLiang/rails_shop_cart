class CreateShopLists < ActiveRecord::Migration
  def change
    create_table :shop_lists do |t|
      t.string :barcode
      t.string :sort
      t.string :name
      t.float  :price
      t.string :unit

      t.timestamps
    end
  end
end
