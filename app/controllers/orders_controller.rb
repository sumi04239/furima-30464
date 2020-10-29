class OrdersController < ApplicationController
before_action :authenticate_user!, only: :index
before_action :move_to_index

  def index
    @order = Order.all
     @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :lot_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    unless current_user = @user
      redirect_to root_path
    end
  end
end

  