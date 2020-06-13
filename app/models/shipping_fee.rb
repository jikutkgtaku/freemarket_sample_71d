class ShippingFee < ActiveHash::Base
  self.data = [
    {id: 1, name: '元払い（出品者負担）'},
    {id: 2, name: '着払い（購入者負担）'}
  ]
end
