class HomepageController < ApplicationController
  def index
    get_cart_num
  end
  def get_cart_num
    @goods = CartList.all
    @cart_num = @cart_num
    @sum_total = 0
    @save_money = 0
    @cart_num = 0
    @goods.each do |i|
      @cart_num += i.count
      @save_money += i.price * i.free_count.to_i
      @sum_total += i.sum - i.price * i.free_count.to_i
    end
  end

  def shop_list
     @list = ShopList.all
     get_cart_num
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
    end
    redirect_to "/homepage/shop_list"
  end

  def reduce_goods
    cart = CartList.find_by_id(params[:id])
    goods = CartList.all
    if goods.length == 0
      # redirect_to "/homepage/shop_list"
    else
      if cart != nil
    cart.sum = 0
    cart.count = cart.count - 1
    cart.sum = cart.count * cart.price
    cart.save
        end
    if FreeGoods.find_by_barcode(cart.barcode)
      cart.free_count = ( cart.count / 3 ).to_i
      cart.save
    end
    if cart.count ==0
      cart.delete
      if FreeList.find_by_barcode(cart.barcode)
       cart.delete
        end
    end
    redirect_to :back
    end
  end

  def add_goods
    cart = CartList.find_by_id(params[:id])
    cart.sum = 0
    cart.count = cart.count + 1
    cart.sum = cart.count * cart.price
    cart.save
    if FreeGoods.find_by_barcode(cart.barcode)
      cart.free_count = ( cart.count / 3 ).to_i
      cart.save
    end
    redirect_to :back
  end

  def shopping_cart
    get_cart_num
  end

  def free_list
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

  def pay_list
    free_list
    @free_list = FreeList.all
    get_cart_num

  end
  def clear_goods
     CartList.all.delete_all
     FreeList.all.delete_all
     redirect_to "/homepage/shop_list"
  end
end
