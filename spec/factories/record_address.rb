FactoryBot.define do
  factory :record_address do
    postal_code { '123-4567' }
    area_id { 2 }
    municipality { '大分市光吉台' }
    street_number { '870-1126' }
    building_name { 'あ' }
    telephone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { FactoryBot.create(:user).id }
    item_id { FactoryBot.create(:item).id }
  end
end
