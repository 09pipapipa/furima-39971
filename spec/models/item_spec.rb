require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do

    context '商品新規登録ができる場合' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品新規登録ができない場合' do
      it 'goods_nameが空では登録できない' do
        @item.goods_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods name can't be blank")
      end
      it 'expositionが空では登録できない' do
        @item.exposition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Exposition can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'categoryは1以外でないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).not_to include("Category must be other than 1")
      end
      it 'conditionは1以外でないと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).not_to include("Condition must be other than 1")
      end
      it 'costは1以外でないと登録できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).not_to include("Cost must be other than 1")
      end
      it 'prefectureは1以外でないと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).not_to include("Prefecture must be other than 1")
      end
      it 'delivery_dateは1以外でないと登録できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).not_to include("Delivery Date must be other than 1")
      end
      it 'priceは300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceは10000000以上は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceは全角英字では登録できない' do
        @item.price = 'ｗｔｒ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは半角文字では登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは全角数字では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは半角英数字混合では登録できない'do
      @item.price = 'abc123'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐づいていないと登録できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).not_to include("User must exist")
      end
    end
  end
end
