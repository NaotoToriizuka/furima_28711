require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/test_image.jpg')
  end

  describe '商品出品機能' do
    context '商品の情報が保存できるとき' do
      it "全ての値が存在すれば保存できる" do
        
      end
    end

    context '商品の情報が保存できないとき' do
      it "imageが空では保存できない" do
      end
      it "nameが空では保存できない" do
      end
      it "descriptionが空では保存できない" do
      end
      it "categoryを選択しなければ保存できない" do
      end
      it "conditionを選択しなければ保存できない" do
      end
      it "postage_payerを選択しなければ保存できない" do
      end
      it "shipping_dayを選択しなければ保存できない" do
      end
      it "prefectureを選択しなければ保存できない" do
      end
      it "priceが¥300~¥9,999,999の間でなければ保存できない" do
      end
    end
  end
end
