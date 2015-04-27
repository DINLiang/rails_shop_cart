class AddPriceToFreeLists < ActiveRecord::Migration
  def change
    add_column :free_lists, :price, :integer
  end
end
