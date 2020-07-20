require 'rails_helper'
describe Creditcards do
  describe '#create' do

    it "customer_idがない場合は登録できないこと" do
      creditcards = build(:creditcards, customer_id: "")
      creditcards.valid?
      expect(creditcard.errors[:customer_id]).to include("を入力してください")
    end

    it "payjp_idがない場合は登録できないこと" do
      creditcards = build(:creditcards, payjp_id: "")
      creditcards.valid?
      expect(creditcards.errors[:payjp_id]).to include("を入力してください")
    end


  end
end
