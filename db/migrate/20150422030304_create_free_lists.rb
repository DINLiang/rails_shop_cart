class CreateFreeLists < ActiveRecord::Migration
  def change
    create_table :free_lists do |t|
      t.string :sort
      t.string :name
      t.integer :count
      t.string :barcode

      t.timestamps
    end
  end
end
