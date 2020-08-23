class ItemsController < ApplicationController
  before_action :move_to_index, except: :index
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :prefecture_id, :postage_payer_id, :sipping_day_id,)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end


end
