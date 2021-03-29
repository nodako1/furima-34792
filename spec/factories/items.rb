FactoryBot.define do
  factory :item do
    name                { 'もち' }
    description         { '説明' }
    category_id         { '2' }
    status_id           { '2' }
    shipping_cost_id    { '2' }
    state_id            { '2' }
    days_to_delivery_id { '2' }
    price               { '2000' }
  end
end
