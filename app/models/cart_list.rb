class CartList < ActiveRecord::Base
# p "???????????????????????????????????"
#   def add_carts
#     p "................................"
#     shop = ShopList.find_by_id(params[:id])
#     cart = CartList.find_by_name(shop.name)
#     if cart
#       cart.sum = 0
#       cart.count = cart.count + 1
#       cart.sum = cart.count * cart.price
#       cart.save
#     else
#       cart = CartList.new
#       cart.name = shop.name
#       cart.sort = shop.sort
#       cart.barcode = shop.barcode
#       cart.unit = shop.unit
#       cart.price = shop.price
#       cart.count = 1
#       cart.sum = shop.price
#       cart.barcode = shop.barcode
#       cart.save
#     end
#     if FreeGoods.find_by_barcode(cart.barcode)
#       cart.free_count = ( cart.count / 3 ).to_i
#       cart.save
#     end
#   end

end
