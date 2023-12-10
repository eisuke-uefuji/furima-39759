require 'rails_helper'

RSpec.describe Item, type: :item do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品新規登録' do
    context '新規登録できる場合' do
      it '商品画像、商品名、商品の説明、カテゴリ、商品の状態、配送料負担、発送元の地域、発送までの日数、価格が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の新規登録できない場合' do
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Name 商品名を入力してください')
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格を入力してください')
      end
      it 'カテゴリが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category can`t be blank')
      end
      it 'conditionが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition can`t be blank')
      end
      it 'delivery_chargeが空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge can`t be blank')
      end
      it 'shipping_spanが空では登録できない' do
        @item.shipping_span_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping span can`t be blank')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image 画像をアップロードしてください')
      end
    end
  end
end
