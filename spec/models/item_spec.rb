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
    context '新規登録できない場合' do
    end

  end
end
