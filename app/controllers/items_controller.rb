class ItemsController < ApplicationController
  before_action :authenticate_user! ,only:[:new, :create, :edit, :destroy]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

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
  end

  def edit
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end 
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

    private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :situation_id, 
      :consignor_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def prevent_url
    unless @item.user == current_user
      redirect_to root_path
    end
  end

  end
