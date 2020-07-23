require 'rails_helper'

describe Image do
  describe '#create' do
    # 漏れていたら出品できないテスト
    it "imageがない場合は登録できないこと" do
      image = build(:image, image: "")
      image.valid?
      expect(image.errors[:image]).to include("を入力してください")
    end

   
  end
end
