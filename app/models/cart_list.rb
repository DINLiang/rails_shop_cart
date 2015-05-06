class CartList < ActiveRecord::Base
  def self.add_carts(id)
    shop = ShopList.find_by_id(id)
    cart = CartList.find_by_name(shop.name)
    if cart
      cart.sum = 0
      cart.count = cart.count + 1
      cart.sum = cart.count * cart.price
      cart.save
    else
      cart = CartList.new
      cart.name = shop.name
      cart.sort = shop.sort
      cart.barcode = shop.barcode
      cart.unit = shop.unit
      cart.price = shop.price
      cart.count = 1
      cart.sum = shop.price
      cart.barcode = shop.barcode
      cart.save
    end
    if FreeGoods.find_by_barcode(cart.barcode)
      cart.free_count = ( cart.count / 3 ).to_i
      cart.save
    else
      cart.free_count = 0
      cart.save
    end
  end

   def self.reduce_good(id)
     cart = CartList.find_by_id(id)
     cart.sum = 0
     cart.count = cart.count - 1
     cart.sum = cart.count * cart.price
     cart.save
     if FreeGoods.find_by_barcode(cart.barcode)
       cart.free_count = ( cart.count / 3 ).to_i
       cart.save
     end
     if cart.count == 0
       cart.delete
       if FreeList.find_by_barcode(cart.barcode)
         cart.delete
       end
     end
   end

  def self.add_good(id)
    cart = CartList.find_by_id(id)
    cart.sum = 0
    cart.count = cart.count + 1
    cart.sum = cart.count * cart.price
    cart.save
    if FreeGoods.find_by_barcode(cart.barcode)
      cart.free_count = ( cart.count / 3 ).to_i
      cart.save
    end
  end

end
