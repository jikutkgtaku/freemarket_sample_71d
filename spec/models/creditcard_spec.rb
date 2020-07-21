require 'rails_helper'

RSpec.describe Creditcard, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# describe Creditcard do
#   describe '#create' do

#     it "customer_idがない場合は登録できないこと" do
#       creditcard = build(:creditcard, customer_id: "")
#       creditcard.valid?
#       expect(creditcard.errors[:customer_id]).to include("を入力してください")
#     end

#     it "payjp_idがない場合は登録できないこと" do
#       creditcard = build(:creditcard, payjp_id: "")
#       creditcard.valid?
#       expect(creditcard.errors[:payjp_id]).to include("を入力してください")
#     end


#   end
# end
