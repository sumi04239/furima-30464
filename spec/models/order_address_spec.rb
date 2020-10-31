require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    describe '情報の保存' do
      context '情報の保存がうまくいく時' do
        it '全ての値が正しく入力されていれば保存できる' do
          expect(@order_address).to be_valid
        end
        it 'building_nameは空でも保存できる' do
          @order_address.building_name = nil
          expect(@order_address).to be_valid
        end
      end
    
      context '情報の保存がうまくいかない時' do
        it 'post_codeが空だと保存できない' do
          @order_address.post_code = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post code can't be blank")
        end
        it 'Prefecture_idが空だと保存できない' do
          @order_address.prefecture_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'cityが空だと保存できない' do
          @order_address.city = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
        it  'lot_numberが空だと保存できない' do
          @order_address.lot_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Lot number can't be blank")
        end
        it 'phone_numberが空だと保存できない' do
          @order_address.phone_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが11桁でないと保存できない' do
          @order_address.phone_number = '0000000000000'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
        end
        it 'post_codeにいはハイフンがないと保存できない' do
          @order_address.post_code = '0000000'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it 'tokenが空では保存できない' do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        it 'prefecture_idが0の時は出品できない' do
          @order_address.prefecture_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
        end
      end
    end
    
end