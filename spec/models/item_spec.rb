require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '全てがあれば出品できる' do
        expect(@item).to be_valid
      end
      it 'goods_nameが40文字以下であれば出品できる' do
        @item.goods_name = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        expect(@item).to be_valid
      end
      it 'imageがあれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが¥300以上で出品できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it 'goods_nameが空だと出品できない' do
        @item.goods_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods name can't be blank")
      end
      it 'descriptionが空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空だと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'post_payer_idについての情報が空だと出品できない' do
        @item.post_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Post payer can't be blank")
      end
      it 'prefecture_idについての情報が空だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'heading_time_idについての情報が体と登録できない' do
        @item.heading_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Heading time can't be blank")
      end
      it 'priceについての情報が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥9,999,999以上だと出品できない' do
        @item.price = '00,000,000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9,999,999')
      end
    end
  end
end
