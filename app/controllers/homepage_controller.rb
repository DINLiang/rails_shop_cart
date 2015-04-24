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
      list.barcode = shop.barcode
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

  def free_list
    @goods = CartList.all
    @free_goods = FreeGoods.all
    for i in @goods
      for j in @free_goods
        if i.barcode == j.barcode
          cart = FreeList.find_by_name(i.name)
          if  cart
            cart.count = (i.count / 3).to_i
            cart.save
          else
            list = FreeList.new
            list.name = i.name
            list.sort = i.sort
            list.count = (i.count / 3).to_i
            list.save
          end
        end
      end
    end
    redirect_to "/homepage/pay_list"
  end

  def pay_list
    @goods = CartList.all
    @free_list = FreeList.all
  end
  def clear_goods
     CartList.all.delete_all
     FreeList.all.delete_all
    redirect_to "homepage/shop_list"
  end


end
