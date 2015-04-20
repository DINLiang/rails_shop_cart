class HomepageController < ApplicationController
  def index

  end
  def shop_list
     @list = ShopList.all
  end
  def add_cart
    cart = CartList.new
    cart.shop_list_id = params[:id].to_i
    cart.sort =  ShopList.find_by_id(params[:id]).sort
    cart.name =  ShopList.find_by_id(params[:id]).name
    cart.price =  ShopList.find_by_id(params[:id]).price
    cart.unit =  ShopList.find_by_id(params[:id]).unit
    cart.count = 1
    cart.save
    redirect_to "/homepage/shop_list"
  end
  def shopping_cart
    @goods = CartList.all
  end
end
