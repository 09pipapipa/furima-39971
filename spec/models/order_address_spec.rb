require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address,user_id: @user.id,item_id: @item.id)
      sleep 0.5
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_codeは空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid? 
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.postal_code = '1234567' 
        @order_address.valid?
        expect(@order_address.errors.full_messages).not_to include('Is invalid. Include hyphen(-)')
      end
      it 'postal_codeのハイフンの位置が正しくないと保存できない' do
        @order_address.postal_code = '1234-567' 
        @order_address.valid?
        expect(@order_address.errors.full_messages).not_to include('Is invalid. Include hyphen(-)')
      end
      it 'prefectureは1以外を選択していないと購入できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では購入できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_number空では購入できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは全角数字では購入できない' do
        @order_address.phone_number = "０９０９９９９８８８８"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Enter only half-width numerals with 10 to 11 digits')
      end
      it 'phone_numberは9桁以下だと購入できない' do
        @order_address.phone_number = "090999888"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Enter only half-width numerals with 10 to 11 digits')
      end
      it 'phone_numberは全角英字では購入できない' do
        @order_address.phone_number = "ａｂｃｅｆｇｈｉｊｋｌ"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Enter only half-width numerals with 10 to 11 digits')
      end
      it 'phone_numberは半角英字では購入できない' do
        @order_address.phone_number = "abcdefghijkl"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Enter only half-width numerals with 10 to 11 digits')
      end
      it 'phone_numberは12桁以上では購入できない' do
        @order_address.phone_number = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Enter only half-width numerals with 10 to 11 digits')
      end
      it 'tokenが空では購入できない' do
        @order_address.token = nil
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
