require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address,user_id: @user.id,item_id: @item.id)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_address.city = ''
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_codeは空では保存できない' do
        @order_address.postal_code = ''
        @order_address.valid? 
        expect(@order_address.errors.full_messages).to include("Can't be blank")
      end
      it 'postal_codeは半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.postal_code = '1234567' 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Is invalid. Include hyphen(-)')
      end
      it 'postal_codeのハイフンの位置が正しくないと保存できない' do
        @order_address.postal_code = '1234-567' 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Is invalid. Include hyphen(-)')
      end
      it 'prefecture_idは0以外を選択していないと保存できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @order.address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Can't be blank")
      end
      it 'street_addressが空では保存できない' do
        @order.address.street_address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Can't be blank")
      end
      it 'phone_numberは全角数字では保存できない' do
        @order.address.phone_number = "０９０９９９９８８８８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Enter only half-width numerals with 10 to 11 digits')
      end
      it 'phone_numberは11桁未満では登録できない' do
        @order.address.phone_number = "0909999888"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Enter only half-width numerals with 10 to 11 digits')
      end
      it 'phone_numberは全角英字では保存できない' do
        @order.address.phone_number = "ａｂｃｅｆｇｈｉｊｋｌ"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Enter only half-width numerals with 10 to 11 digits')
      end
      it 'phone_numberは半角英字では保存できない' do
        @order.address.phone_number = "abcdefghijkl"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Enter only half-width numerals with 10 to 11 digits')
      end
      it 'tokenが空では保存できない' do
        @order.address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが紐づいていないと保存できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていないと保存できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
