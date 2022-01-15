class ItemsController < ApplicationController  

  def new
    @item = Item.new
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


    private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :situation_id, 
      :consignor_id, :shipping_area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  end
