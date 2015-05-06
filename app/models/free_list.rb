class FreeList < ActiveRecord::Base

  def self.free_lists
    @goods = CartList.all
    @free_goods = FreeGoods.all
    @goods.each do |i|
      @free_goods.each do |j|
        if i.barcode == j.barcode
          cart = FreeList.find_by_name(i.name)
          if  cart
            cart.count = (i.count / 3).to_i
            cart.save
          else
            list = FreeList.new
            list.name = i.name
            list.barcode = i.barcode
            list.sort = i.sort
            list.price = i.price
            list.count = (i.count / 3).to_i
            list.save
          end
        end
      end
    end
  end
end
