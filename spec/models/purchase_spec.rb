require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactotyBot.build(:purchase)
    @address = FactotyBot.build(:address)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'building_name以外の全ての値が存在すれば購入できる' do
      end
    end

    context '商品が購入できないとき' do
      it 'numberが空では購入できない' do
      end
      it 'cvcが空では購入できない' do
      end
      it 'exp_monthが空では購入できない' do
      end
      it 'exp_yearが空では購入できない' do
      end
      it 'post_codeが空では購入できない' do
      end
      it 'post_codeにはハイフンがないと購入できない' do
      end
      it 'prefectureを選択しなければ購入できない' do
      end
      it 'Active Hashで「1」が選択されたら購入できない' do
      end
      it 'cityが空では購入できない' do
      end
      it 'house_numberが空では購入できない' do
      end
      it 'phone_numberが空では購入できない' do
      end
      it 'phone_numberでハイフンがあると購入できない' do
      end
    end
  end
end
