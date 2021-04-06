class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_purchase, only: [:index, :create]

  def index
    @purchase_shipment = PurchaseShipment.new
    set_purchase
  end

  def create
    set_purchase
    binding.pry
    @purchase_shipment = PurchaseShipment.new(purchase_params)
    if @purchase_shipment.valid?
      pay_item
      @purchase_shipment.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_shipment).permit(:post_code, :state_id, :city, :street_address, :suburb, :telephone).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    binding.pry
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item_params[:price],            # 商品の値段
      card: purchase_params[:token],  # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
