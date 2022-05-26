require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品を出品する' do
    context '商品を出品できるとき' do
      it '全てのフォームが条件を満たした上で存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない時' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is invalid")
      end
      it '商品の状態情報が空では出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition is invalid")
      end
      it '配送料の負担情報が空では出品できない' do
        @item.payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Payer is invalid")
      end
      it '発送元の地域情報が空では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is invalid")
      end
      it '発送までの日数情報が空では出品できない' do
        @item.waiting_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Waiting day is invalid")
      end
      it '出品価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '出品価格が300円以上でなければ出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Price is out of setting range')
      end
      it '出品価格が9,999,999円以下でなければ出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Price is out of setting range')
      end
      it '出品価格は半角数値でなければ出品できない' do
        @item.price = '５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Price is out of setting range')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
