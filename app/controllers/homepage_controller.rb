class HomepageController < ApplicationController
  def index
    get_cart_number
  end

  def get_cart_number
    get_goods
    @goods.each do |i|
      @cart_num += i.count
      @save_sum += i.price * i.free_count.to_i
      @sum_total += i.sum - i.price * i.free_count.to_i
    end
  end

  def get_cart_num
    add_cart
    get_cart_number
    respond_to do |format|
      format.json { render :json =>  @cart_num }
      format.js
    end
  end

  def get_carts_number
     CartList.good(params[:id],true)
     get_carts
  end

  def get_goods
    @goods = CartList.all
    @cart_num = @save_sum = @sum_total = @total_count =0
    # @save_sum = 0
    # @sum_total = 0
    # @total_count = 0
  end

  def get_carts
    get_goods
    @good = CartList.find_by_id(params[:id])
    if @good == nil
      make_jump
    else
      make_show
      show_goods
    end
  end

def make_jump
  @total_count = 0
  @goods.each do |i|
    @cart_num += i.count
  end
  @total_count += @cart_num
  if @total_count == 0
    FreeList.all.delete_all
  end
  respond_to do |format|
    format.json { render :json => [0,@total_count] }
    format.js
  end
end
def make_show
  @count = @good.count
  @sum = @good.sum
  @free_count = @good.free_count
  @goods.each do |i|
    @cart_num += i.count
    @save_sum = i.price * (i.count - i.free_count)
    @sum_total += @save_sum
  end
end
  def show_goods
    @total_count += @cart_num
    @save_sum = @good.price * (@good.count - @good.free_count)
    respond_to do |format|
      format.json { render :json => [params[:id],@cart_num, @count, @sum,@save_sum,@sum_total,@free_count,@total_count]}
      format.js
    end
  end

   def get_carts_numbers
    CartList.good(params[:id],false)
    get_carts
  end

  def shop_list
     @list = ShopList.all
     get_cart_number
  end

  def add_cart
    CartList.add_carts(params[:id])
  end

  def reduce_goods
    CartList.good(params[:id],true)
  end

  def add_goods
    CartList.good(params[:id],false)
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
