class OrdersController < ApplicationController
before_action :authenticate_user!, only: :index
before_action :move_to_index
before_action :sold_out 


  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end

  end

  private

  def order_address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :lot_number, :building_name, :phone_number, :number, :exp_month, :exp_year, :cvc,:price).merge(user_id: current_user.id, item_id: params[:item], token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_out
    @item = Item.find(params[:item_id])
    if Order.where(item_id: @item.id).exists?
      redirect_to root_path
    end
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_address_params[:token],
      currency: 'jpy'
      )
  end
  
end

  