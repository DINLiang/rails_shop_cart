class HomepageController < ApplicationController
  def index
    get_cart_number
  end

  def get_cart_number
    @goods = CartList.all
    @sum_total = 0
    @save_money = 0
    @cart_num = 0
    @goods.each do |i|
      @cart_num += i.count
      @save_money += i.price * i.free_count.to_i
      @sum_total += i.sum - i.price * i.free_count.to_i
    end
    @cart_num = @cart_num
  end

  def get_cart_num
    add_cart
    @goods = CartList.all
    @cart_num = 0
    @goods.each do |i|
      @cart_num += i.count
    end
    @cart_num = @cart_num
    respond_to do |format|
      format.json { render :json =>  @cart_num }
      format.js
    end
  end

   def get_carts_number
     CartList.reduce_good(params[:id])
     @goods = CartList.all
     @cart_num = 0
     @save_sum = 0
     @sum_total = 0
     @total_count = 0
     @good = CartList.find_by_id(params[:id])
     if @good == nil
       @total_count = 0
       @goods.each do |i|
       @cart_num += i.count
       end
       @total_count += @cart_num
         respond_to do |format|
         format.json { render :json => [0,@total_count] }
         format.js
       end
     else
       @count = @good.count
     @sum = @good.sum
     @free_count = @good.free_count
     @goods.each do |i|
       @cart_num += i.count
       @save_sum = i.price * (i.count - i.free_count)
       @sum_total += @save_sum
     end
     @total_count += @cart_num
     @save_sum = @good.price * (@good.count - @good.free_count)
     respond_to do |format|
       format.json { render :json => [params[:id],@cart_num, @count, @sum,@save_sum,@sum_total,@free_count,@total_count]}
       format.js
     end
    end
   end

   def get_carts_numbers
    CartList.add_good(params[:id])
    @goods = CartList.all
    @cart_num = 0
    @sum_total = 0
    @total_count = 0
    @good = CartList.find_by_id(params[:id])
    @count = @good.count
    @sum = @good.sum
    @free_count = @good.free_count
    @goods.each do |i|
      @cart_num += i.count
      @save_sum = i.price * (i.count - i.free_count)
      @sum_total += @save_sum
    end
    @save_sum = @good.price * (@good.count - @good.free_count)
    @total_count += @count
    respond_to do |format|
      format.json { render :json => [params[:id],@cart_num, @count, @sum,@save_sum,@sum_total,@free_count,@total_count] }
      format.js
    end
  end

  def shop_list
     @list = ShopList.all
     get_cart_number
  end

  def add_cart
   id = params[:id]
    CartList.add_carts(id)
  end

  def reduce_goods
    id = params[:id]
    CartList.reduce_good(id)
  end

  def add_goods
    id = params[:id]
    CartList.add_good(id)
  end

  def shopping_cart
     get_cart_number
     @goods = CartList.all
  end

  def free_list
    FreeList.free_lists
  end

  def pay_list
    free_list
    @free_list = FreeList.all
    get_cart_number
  end

  def clear_goods
     CartList.all.delete_all
     FreeList.all.delete_all
     redirect_to "/homepage/shop_list"
  end
end
