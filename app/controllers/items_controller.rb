class ItemsController < ApplicationController
  before_action :move_to_signin, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  end

  def edit
    unless user_signed_in? && current_user == @item.user && @item.purchase == nil 
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in? && current_user == @item.user
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end

  end

  private

  def item_params
    params.require(:item).permit(:name, :item_summary, :price, :category_id, :condition_id, :delivery_charge_id,
                                 :shipping_span_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  def move_to_signin
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
