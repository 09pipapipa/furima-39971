class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index,except: [:index]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @item.user.reload
      redirect_to root_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if current_user
      redirect_to root_path unless @item.user == current_user
    else
      redirect_to login_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:goods_name, :price, :exposition, :category_id, :condition_id, :cost_id, :prefecture_id,
                                 :delivery_date_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
