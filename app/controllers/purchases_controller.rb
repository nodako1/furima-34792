class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:index, :create]
  before_action :authenticate_user!
  before_action :move_to_item_index, only: [:index, :create]

  def index
    @purchase_shipment = PurchaseShipment.new
  end

  def create
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
  
  def move_to_item_index
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase != nil
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,    # 商品の値段
      card: purchase_params[:token],  # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
