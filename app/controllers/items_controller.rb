class ItemsController < ApplicationController  
  def item_params
    params.require(:item).permit(:content, :image).merge(item_id: current_item.id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

    private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :situation_id, :consignor_id, :shipping_area_id, :days_to_ship_id, :price)
  end


  end

end
