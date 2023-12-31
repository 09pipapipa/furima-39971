class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index,:show]
  before_action :set_item, only: [:show, :edit, :update,:destroy]

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
  end

  def edit
    if current_user 
      redirect_to root_path unless @item.user.id == current_user.id && @item.order == nil
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user && @item.user == current_user
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

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
