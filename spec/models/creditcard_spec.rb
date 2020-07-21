require 'rails_helper'

describe Creditcard do
  describe '#create' do

    it "customer_idがない場合は登録できないこと" do
      creditcard = build(:creditcard, user_id: "")
      creditcard.valid?
      expect(creditcard.errors[:user_id]).to include()
    end

    it "customer_idがない場合は登録できないこと" do
      creditcard = build(:creditcard, customer_id: "")
      creditcard.valid?
      expect(creditcard.errors[:customer_id]).to include()
    end

    it "payjp_idがない場合は登録できないこと" do
      creditcard = build(:creditcard, payjp_id: "")
      creditcard.valid?
      expect(creditcard.errors[:payjp_id]).to include()
    end

  end
end
