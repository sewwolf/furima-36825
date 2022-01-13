FactoryBot.define do
  factory :item do
    item_name                 { 'a' }
    detail                    { 'a' }
    category_id               { 2 }
    condition_id              { 2 }
    postage_id                { 2 }
    area_id                   { 2 }
    delivery_time_id          { 2 }
    price                     { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/nobi2.jpg'), filename: 'nobi2.jpg')
    end
  end
end
