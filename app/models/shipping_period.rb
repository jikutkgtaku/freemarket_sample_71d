class Shipping_period < ActiveHash::Base
  self.data = [
    {id: 1, name: '1〜2日で発送'},
    {id: 1, name: '2〜3日で発送'},
    {id: 1, name: '4〜7日で発送'}
  ]
end
