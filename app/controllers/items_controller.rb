class ItemsController < ApplicationController
  before_action :authenticate_user! ,only:[:new, :create]

  def index
    @items = Item.all.order(created_at: :desc)
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
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

    private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :situation_id, 
      :consignor_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  end
