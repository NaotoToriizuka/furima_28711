class PurchasesController < ApplicationController
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      # binding.pry
      @purchase.save
      return redirect_to root_path
    else
      render "index"
    end
  end


  private
  
      def purchase_params
    params.permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # def address_params
  #   params.require(:address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(purchase_id: current_user.id)
  # end
 

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    unless user_signed_in?
     redirect_to new_user_session_path
    end
  end
end

