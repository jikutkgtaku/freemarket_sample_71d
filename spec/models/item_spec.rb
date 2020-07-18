require 'rails_helper'

describe Item do
  describe '#create' do
    # 漏れていたら出品できないテスト
    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "introductionがない場合は登録できないこと" do
      item = build(:item, introduction: "")
      item.valid?
      expect(item.errors[:introduction]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "sellerがない場合は登録できないこと" do
      item = build(:item, seller: "")
      item.valid?
      expect(item.errors[:seller]).to include("を入力してください")
    end

    it "condition_idがない場合は登録できないこと" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("を入力してください")
    end

    it "shipping_fee_idがない場合は登録できないこと" do
      item = build(:item, shipping_fee_id: "")
      item.valid?
      expect(item.errors[:shipping_fee_id]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "shipping_period_idがない場合は登録できないこと" do
      item = build(:item, shipping_period_id: "")
      item.valid?
      expect(item.errors[:shipping_period_id]).to include("を入力してください")
    end

    it "shipping_way_idがない場合は登録できないこと" do
      item = build(:item, shipping_way_id: "")
      item.valid?
      expect(item.errors[:shipping_way_id]).to include("を入力してください")
    end

    it "status_idがない場合は登録できないこと" do
      item = build(:item, status_id: "")
      item.valid?
      expect(item.errors[:status_id]).to include("を入力してください")
    end

    # 文字数のテスト
    it "introductionが1000以上では登録できないこと" do
      item = build(:item, introduction: "1001")
      item.valid?
      expect(item.errors[:introduction]).to include() 
    end

    it "introductionが1000以下では登録できること" do
      item = build(:item, introduction: "1000")
      expect(item.errors[:introduction]).to include() 
    end

    #金額のテスト
    it "priceが300以下では登録できないこと" do
      item = build(:item, price: "300")
      item.valid?
      expect(item.errors[:price]).to include() 
    end

    it "priceが9999999以上では登録できないこと" do
      item = build(:item, price: "1000000")
      item.valid?
      expect(item.errors[:price]).to include() 
    end
  end
end
