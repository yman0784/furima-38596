class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
  end

end
