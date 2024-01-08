class OrdersController < ApplicationController
  def index
    @purchase_deliver = PurchaseDeliver.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_deliver = PurchaseDeliver.new(purchase_params)
    @item = Item.find(params[:item_id])
    binding.pry
    if @purchase_deliver.valid?
      @purchase_deliver.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.require(:purchase_deliver).permit(:post_number, :prefecture_id, :city, :street_line, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
