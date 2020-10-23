class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:goods_name, :descreption, :category_id, :condition_id, :post_payer_id, :prefecture_id, :heading_time_id, :price).merge(user_id: current_user.id)
  end
end
