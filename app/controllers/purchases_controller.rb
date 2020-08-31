class PurchasesController < ApplicationController
  before_action :move_to_index
  before_action :correct_user
  before_action :purchased_item


  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end


  private
  
  def purchase_params 
    params.permit(:purchase_address, :item_id, :token, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end

  def correct_user
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def purchased_item
    @item = Item.find(params[:item_id])
    if @item.purchase
     redirect_to root_path
    end
  end

  def move_to_index
    unless user_signed_in?
     redirect_to new_user_session_path
    end
  end
end

