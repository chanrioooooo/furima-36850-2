class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :area_id, :municipalities, :address, :building, :telephone_num)
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

end
