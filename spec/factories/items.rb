FactoryBot.define do
  factory :item do
    image               { Faker::Lorem.sentence }
    name                { 'もち' }
    description         { Faker::Lorem.sentence }
    category_id         { 2 }
    status_id           { 2 }
    shipping_cost_id    { 2 }
    state_id            { 2 }
    days_to_delivery_id { 2 }
    price               { 2000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/apple-touch-icon-precomposed.png'), filename: 'test_image.png')
    end
  end
end
