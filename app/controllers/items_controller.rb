class ItemsController < ApplicationController
  def index
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

  private
  def item_params
    params.require(:item).permit(:name, :item_summary, :price, :category_id, :condition_id, :delivery_charge_id, :shipping_span_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end

end
