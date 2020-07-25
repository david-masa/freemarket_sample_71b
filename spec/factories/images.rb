FactoryBot.define do
  factory :image  do
    # binding.pry
    # item_id {create(:item).id}
    # item
    src   {File.open("#{Rails.root}/spec/fixtures/test_image.jpg")}
    association :item
  end
end
