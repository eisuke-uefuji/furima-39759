require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、苗字全角・名前全角、苗字カナ・名前カナ、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが@を含まないと登録できない' do
        @user.email = 'gagagagmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが重複している場合では登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字のみでは、登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it 'passwordが半角数字のみでは、登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it 'passwordが全角のみでは、登録できない' do
        @user.password = '０あ００００'
        @user.password_confirmation = '０あ００００ '
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で入力してください')
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '苗字全角が空では登録できない' do
        @user.familyname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kanji can't be blank")
      end
      it '名前全角が空では登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
      end
      it '苗字全角が全角以外では登録できない' do
        @user.familyname_kanji = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname kanji は全角で入力してください')
      end
      it '名前全角が全角以外では登録できない' do
        @user.firstname_kanji = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kanji は全角で入力してください')
      end
      it '苗字カナ全角が空では登録できない' do
        @user.familyname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kana can't be blank")
      end
      it '名前カナ全角が空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it '苗字カナ全角がカタカナ以外は登録できない' do
        @user.familyname_kana = '上藤'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname kana is invalid')
      end
      it '苗字カナ全角が半角では登録できない' do
        @user.familyname_kana = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname kana is invalid')
      end
      it '名前カナ全角がカタカナ以外では登録できない' do
        @user.firstname_kana = '英資'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana is invalid')
      end
      it '名前カナ全角が半角では登録できない' do
        @user.firstname_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana is invalid')
      end
      it '生年月日が空では登録できない' do
        @user.birthdate = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end
    end
  end
end
