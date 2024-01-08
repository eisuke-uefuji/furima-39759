class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_deliver = PurchaseDeliver.new
    @item = Item.find(params[:item_id])
  end

  def create

    @purchase_deliver = PurchaseDeliver.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_deliver.valid?
      pay_item
      @purchase_deliver.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.require(:purchase_deliver).permit(:post_number, :prefecture_id, :city, :street_line, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
