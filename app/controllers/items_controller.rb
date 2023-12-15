class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all.order("created_at DESC")
    @delivery_charges = DeliveryCharge.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_summary, :price, :category_id, :condition_id, :delivery_charge_id,
                                 :shipping_span_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
