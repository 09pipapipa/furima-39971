class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
  end

  private

  def item_params
    params.require(:item).permit(:goods_name, :price, :exposition, :category_id, :condition_id, :cost_id, :prefecture_id,
                                 :delivery_date_id, :image).merge(user_id: current_user.id)
  end
end
