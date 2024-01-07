class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :purchase,only:[:index,:create]
  before_action :check_login, only: [:index]
  before_action :login_user, only:[:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    if  @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end

  end


  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def purchase
    @item = Item.find(params[:item_id])
  end

  def check_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def login_user
    if current_user == @item.user || @item.order != nil
      redirect_to root_path 
    end
  end

end
