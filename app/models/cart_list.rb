class CartList < ActiveRecord::Base
  def self.add_carts(id)
    shop = ShopList.find_by_id(id)
    cart = CartList.find_by_name(shop.name)
    if cart
      # save_more_goods
      cart.sum = 0
      cart.count = cart.count + 1
      cart.sum = cart.count * cart.price
      cart.save
    else
      CartList.create(:name=>shop.name,:sort => shop.sort,:barcode => shop.barcode,:unit=>shop.unit,:price=>shop.price,:count=>1,:sum=>shop.price,:barcode=>shop.barcode)
    end
    CartList.set_free_count(cart)
  end

  # def save_more_goods
  #   shop = ShopList.find_by_id(id)
  #   cart = CartList.find_by_name(shop.name)
  #   cart.sum = 0
  #   cart.count = cart.count + 1
  #   cart.sum = cart.count * cart.price
  #   cart.save
  # end


   def self.reduce_good(id)
     cart = CartList.find_by_id(id)
     cart.sum = 0
     cart.count = cart.count - 1
     cart.sum = cart.count * cart.price
     cart.save
     CartList.set_free_count(cart)
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
    CartList.set_free_count(cart)
  end

  def self.set_free_count(cart)
    if FreeGoods.find_by_barcode(cart.barcode)
      cart.free_count = ( cart.count / 3 ).to_i
      cart.save
    else
      cart.free_count = 0
      cart.save
    end
  end

end
