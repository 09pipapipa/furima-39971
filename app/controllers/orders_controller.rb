class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end


  private

  def order_params
    params.permit(:item).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(order_id: @order.id)
  end

end
