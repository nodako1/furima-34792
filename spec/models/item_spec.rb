require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it '全ての情報が正しく入力されていれば出品される' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品画像が一枚ないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報がないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank", 'is not a number')
      end
      it 'カテゴリーの情報がないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include('must be other than 1')
      end
      it '商品の状態についての情報がないと出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors[:status_id]).to include("can't be blank", 'is not a number')
      end
      it '商品の状態についての情報がないと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors[:status_id]).to include('must be other than 1')
      end
      it '配送料の負担についての情報がないと出品できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors[:shipping_cost_id]).to include("can't be blank", 'is not a number')
      end
      it '配送料の負担についての情報がないと出品できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors[:shipping_cost_id]).to include('must be other than 1')
      end
      it '発送元の地域についての情報がないと出品できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors[:state_id]).to include("can't be blank", 'is not a number')
      end
      it '発送元の地域についての情報がないと出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors[:state_id]).to include('must be other than 1')
      end
      it '発送までの日数についての情報がないと出品できない' do
        @item.days_to_delivery_id = ''
        @item.valid?
        expect(@item.errors[:days_to_delivery_id]).to include("can't be blank", 'is not a number')
      end
      it '発送までの日数についての情報がないと出品できない' do
        @item.days_to_delivery_id = 1
        @item.valid?
        expect(@item.errors[:days_to_delivery_id]).to include('must be other than 1')
      end
      it '販売価格についての情報がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は、¥300~¥9,999,999の間でないと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it '販売価格は、¥300~¥9,999,999の間でないと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it '販売価格は全角文字では出品できない' do
        @item.price = '２００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格は半角英数混合では出品できない' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格は半角英語だけでは出品できない' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
