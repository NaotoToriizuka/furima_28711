class ItemsController < ApplicationController
  before_action :move_to_index, except: :index
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :escription, :description, :category_id, :condition_id, :postage_payer_id, :shipping_day_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end

  

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end


end
