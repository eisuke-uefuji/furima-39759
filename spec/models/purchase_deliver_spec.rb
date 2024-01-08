require 'rails_helper'

RSpec.describe PurchaseDeliver, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @purchase_deliver = FactoryBot.build(:purchase_deliver, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_deliver).to be_valid
      end
      it 'buildingが空でも保存できること' do
        @purchase_deliver.building = ''
        expect(@purchase_deliver).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'item_idが空だと保存できないこと' do
        @purchase_deliver.item_id = ''
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_numberが空だと保存できないこと' do
        @purchase_deliver.post_number = ''
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Post number can't be blank", "Post number is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @purchase_deliver.prefecture_id = ''
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Prefecture can't be blank", "Prefecture ----以外を選択してください。")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_deliver.city = ''
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("City can't be blank")
      end
      it 'street_lineが空だと保存できないこと' do
        @purchase_deliver.street_line = ''
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Street line can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_deliver.phone_number = ''
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Phone number can't be blank", "Phone number 電話番号は必須です")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_deliver.token = ''
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Token can't be blank")
      end
    end

  end
end