class ItemsController < ApplicationController  
  def item_params
    params.require(:item).permit(:content, :image).merge(item_id: current_item.id)
  end

  def new
    @item = Item.new
  end

end
