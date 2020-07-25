FactoryBot.define do

  factory :address do
    user_id       {1}
    family_name              {"テスト"}
    first_name               {"テスト"}
    family_name_kana         {"テスト"}
    first_name_kana          {"テスト"}
    postal_code              {"123-1234"}
    city                     {"愛知県"}
    local                    {"名古屋市港区"}
    block                    {"1-1-1"}
  end

end