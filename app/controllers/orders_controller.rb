class OrdersController < ApplicationController
  def index
    @purchase_deliver = PurchaseDeliver.new
  end

  def create
    @purchase_deliver = PurchaseDeliver.new(purchase_params)
    if @purchase_deliver.valid?
      @purchase_deliver.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.require(:purchase_deliver).permit(:item_id, :post_number, :prefecture_id, :city, :street_line, :building, :phone_number).merge(user_id: current_user.id)
  end
end
