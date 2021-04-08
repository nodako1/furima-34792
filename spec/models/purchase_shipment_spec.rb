require 'rails_helper'

RSpec.describe PurchaseShipment, type: :model do
  describe '購入先の情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipment = FactoryBot.build(:purchase_shipment, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it '配送先とtokenがあれば保存ができること' do
        expect(@purchase_shipment).to be_valid
      end
      it '建物名が空でも保存ができること' do
        @purchase_shipment.suburb = nil
        expect(@purchase_shipment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @purchase_shipment.token = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @purchase_shipment.user_id = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @purchase_shipment.item_id = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空では登録できないこと' do
        @purchase_shipment.post_code = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号の保存にはハイフンが必要なこと' do
        @purchase_shipment.post_code = '1111111'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が空では登録できないこと' do
        @purchase_shipment.state_id = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("State can't be blank")
      end
      it '都道府県が1では登録できないこと' do
        @purchase_shipment.state_id = 1
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("State can't be blank")
      end
      it '市区町村が空では登録できないこと' do
        @purchase_shipment.city = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できないこと' do
        @purchase_shipment.street_address = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空では登録できないこと' do
        @purchase_shipment.telephone = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号は11桁以内の数値のみでないと登録できないこと' do
        @purchase_shipment.telephone = '000000000000'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include('Telephone is invalid.')
      end
      it '電話番号に数値以外が含まれている場合は登録できないこと' do
        @purchase_shipment.telephone = 'aaaaaaaaaaa'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include('Telephone is invalid.')
      end
    end
  end
end
