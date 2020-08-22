require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての値が存在すれば登録できる" do
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwordが英字と数字の両方を含めないと登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
      it "last_nameが空だと登録できない" do
      end
      it "last_nameが全角日本語でないと登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "first_nameが全角日本語でないと登録できない" do
      end
      it "last_name_kanaが空だと登録できない" do
      end
      it "last_name_kanaが全角カタカナでないと登録できない" do
      end
      it "first_name_kanaが空だと登録できない" do
      end
      it "first_name_kanaが全角カタカナでないと登録できない" do
      end
      it "birth_dayが空だと登録できない" do
      end

    end
  end
end
