class AddBarcodeToCartLists < ActiveRecord::Migration
  def change
    add_column :cart_lists, :barcode, :string
  end
end
