require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase_address)
  end
  
  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'building_name以外の値が存在すれば購入できる' do
        @purchase.building_name = nil
        expect(@purchase).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'post_codeが空では購入できない' do
        @purchase.post_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code Input correctly")
      end
      it 'post_codeにはハイフンがないと購入できない' do
        @purchase.post_code = 0000000
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code Input correctly")
      end
      it 'prefectureを選択しなければ購入できない' do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture Select")
      end
      it 'Active Hashで「1」が選択されたら購入できない' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空では購入できない' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @purchase.house_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberでハイフンがあると購入できない' do
        @purchase.phone_number = '080-0000-0000'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number Input correctly")
      end
    end
  end
end
