#テストをパスするためuserとcategoryとbrandのコードを追記
FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    firstname             {"夏"}
    lastname              {"佐々木"}
    firstname_kana        {"ナツ"}
    lastname_kana         {"ササキ"}
    birth_year            {"2012"}
    birth_month           {"12"}
    birth_day             {"10"}
    tel_number            {"09000000000"}
 end

FactoryBot.define do

  factory :category do
    name                  {"レディース"}
  end  

FactoryBot.define do

  factory :brand do
    name                  {"シャネル"}
  end      

#itemのコードはここから
FactoryBot.define do

  factory :item do
    user_id               {1}
    name                  {"ワンピース"}
    introduction          {"宜しくお願いします"}
    price                 {"1000"}
    condition_id          {"1"}
    size_id               {"1"}
    shipping_fee_id       {"1"}
    prefecture_id         {"1"}
    shipping_period_id    {"1"}
    shipping_way_id       {"1"}
    status_id             {"1"}
    #buyerとsellerは、user_id {1}の記述があればOK?
    # buyer              {"1"}
    # seller             {"1"}

  end
end