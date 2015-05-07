class FreeList < ActiveRecord::Base
  def self.free_lists
    @goods = CartList.all
    @free_goods = FreeGoods.all
    @goods.each do |i|
      FreeList.judge_free_good(i)
    end
  end

  def self.judge_free_good(i)
    @free_goods.each do |j|
      if i.barcode == j.barcode
        FreeList.all.delete_all
        cart = FreeList.find_by_name(i.name)
        FreeList.creat_free_good(cart,i)
        end
      end
  end

  def self.creat_free_good(cart,i)
    if cart
      cart.count = (i.count / 3).to_i
      cart.save
    else
      FreeList.create(:name=>i.name,:barcode=>i.barcode,:sort=>i.sort,:price=>i.price,:count=>(i.count / 3).to_i)
    end
  end
end
