class AddFreeCountToCartLists < ActiveRecord::Migration
  def change
    add_column :cart_lists, :free_count, :integer
  end
end
