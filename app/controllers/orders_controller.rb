class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @orders = Order.all
  end

  def create
    binding.pry
  end

  def show
    
  end
end
