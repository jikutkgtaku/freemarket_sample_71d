require 'rails_helper'
describe Address do
  describe '#create' do

    # 必須項目のテストコード
    

    it "post_numberがない場合は登録できないこと" do
      address = build(:address, post_number: "")
      address.valid?
      expect(address.errors[:post_number]).to include("を入力してください")
    end

    it "firstnameがない場合は登録できないこと" do
      address = build(:address, firstname: "")
      address.valid?
      expect(address.errors[:firstname]).to include("を入力してください")
    end

    it "lastnameがない場合は登録できないこと" do
      address = build(:address, lastname: "")
      address.valid?
      expect(address.errors[:lastname]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "addressがない場合は登録できないこと" do
      address = build(:address, address: "")
      address.valid?
      expect(address.errors[:address]).to include("を入力してください")
    end

    

  end
end