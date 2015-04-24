class CreateFreeGoods < ActiveRecord::Migration
  def change
    create_table :free_goods do |t|
      t.string :barcode

      t.timestamps
    end
  end
end
