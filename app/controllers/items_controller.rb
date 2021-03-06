class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
 
  def index
    @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)

    if @item.valid?
      @item.update(item_params)
      redirect_to item_path
    else
      render "edit"
    end
  end

  def destroy
    if @item.valid?
      @item.destroy
      redirect_to root_path
    else
      render "show"
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :escription, :description, :category_id, :condition_id, :postage_payer_id, :shipping_day_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
