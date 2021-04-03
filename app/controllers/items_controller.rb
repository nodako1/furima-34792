class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order('created_at DESC')
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
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.save
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_cost_id, :state_id,
                                 :days_to_delivery_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
