class HomepageController < ApplicationController
  def index
  end
  def shop_list
     @list = ShopList.all
  end
  def add_cart
    shop = ShopList.find_by_id(params[:id])
    cart = CartList.find_by_name(shop.name)
    if cart
      cart.sum = 0
      cart.count = cart.count + 1
      cart.sum = cart.count * cart.price
      cart.save
    else
      list = CartList.new
      list.name = shop.name
      list.sort = shop.sort
      #list.barcode = shop.barcode
      list.unit = shop.unit
      list.price = shop.price
      list.count = 1
      list.sum = shop.price
      #list.shop_id = shop.id
      list.save
    end
    redirect_to "/homepage/shop_list"
  end
  def shopping_cart
    @goods = CartList.all
    @sum_total = 0
    @goods.each do |k|
      @sum_total += k.sum
    end
  end
end
