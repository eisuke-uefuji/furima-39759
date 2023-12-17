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
      it '商品の説明が空では登録できない' do
        @item.item_summary = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Item summary 商品の概要を入力してください')
      end
      it 'カテゴリが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category ----以外を選択してください。')
      end
      it 'conditionが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition ----以外を選択してください。')
      end
      it 'delivery_chargeが空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge ----以外を選択してください。')
      end
      it 'shipping_spanが空では登録できない' do
        @item.shipping_span_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping span ----以外を選択してください。')
      end
      it 'prefectureが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture ----以外を選択してください。')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image 画像をアップロードしてください')
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category ----以外を選択してください。')
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition ----以外を選択してください。')
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge ----以外を選択してください。')
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture ----以外を選択してください。')
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.shipping_span_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping span ----以外を選択してください。')
      end
      it '価格に半角数字以外が含まれている場合は出品できない（※半角数字以外が一文字でも含まれていれば良い）' do
        @item.price = ' a + #{rand(300..9_999_999)}'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 販売価格は¥300から¥9,999,999の間でなければなりません')
      end
      it '価格が300円未満では出品できない' do
        @item.price = 'rand(0..299)'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 販売価格は¥300から¥9,999,999の間でなければなりません')
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 販売価格は¥300から¥9,999,999の間でなければなりません')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
