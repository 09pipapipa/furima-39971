class ItemsController < ApplicationController

  before_action :authenticate_user!, except:[:index, :show]

  def index

  end

  def new
    
  end

  def show
    
  end

  
  private

  def item_params
    params.require(:image).permit(:content, :image).merge(user_id: current_user.id)
  end
end
