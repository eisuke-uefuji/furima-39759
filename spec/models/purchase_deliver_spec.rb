require 'rails_helper'

RSpec.describe PurchaseDeliver, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_deliver = FactoryBot.build(:purchase_deliver, user_id: user.id, item_id: item.id )
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
        expect(@purchase_deliver.errors.full_messages).to include("Post number can't be blank")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @purchase_deliver.prefecture_id = ''
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Prefecture can't be blank")
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
        expect(@purchase_deliver.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_deliver.token = ''
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Token can't be blank")
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @purchase_deliver.prefecture_id = '1'
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Prefecture ----以外を選択してください。")
      end
      it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
        @purchase_deliver.post_number = '7771111'
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it '電話番号が9桁以下では購入できない' do
        @purchase_deliver.phone_number = '000000'
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Phone number 電話番号は必須です")
      end
      it '電話番号が12桁以上では購入できない' do
        @purchase_deliver.phone_number = '00000000000000'
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Phone number 電話番号は必須です")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @purchase_deliver.phone_number = '0000000ああああ'
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("Phone number 電話番号は必須です")
      end
      it 'userが紐付いていなければ購入できない' do
        @purchase_deliver.user_id = ''
        @purchase_deliver.valid?
        expect(@purchase_deliver.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end