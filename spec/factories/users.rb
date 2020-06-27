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

end