require 'rails_helper'
describe Item do
  describe '#create' do
  it "is valid with a name, introduction, price, category_id, brand_id, condition_id, size_id, shipping_fee_id, prefecture_id, shipping_period_id, shipping_way_id, status_id, user_id" do
    user = create(:user)
    category = create(:category)
    brand = create(:brand)
    item = FactoryBot.build(:item, user_id: user[:id], category_id: category[:id] , brand_id: brand[:id])
    expect(item).to be_valid
  end
end
end

