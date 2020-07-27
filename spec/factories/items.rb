FactoryBot.define do

  factory :item do
    seller_id                 {1} 
    name                      {"sasaki"}
    introduction              {"コメント"}
    price                     {"2000"}
    category_id               {1} 
    condition_id              {1}   
    shipping_fee_id           {1}    
    prefecture_id             {1} 
    shipping_period_id        {1} 
    shipping_way_id           {1} 
    status_id                 {1} 
  end

end