FactoryBot.define do
  factory :purchase_shipment do
  token           {"tok_abcdefghijk00000000000000000"}
  post_code       { "111-1111" }
  state_id        { 3 }
  city            { "渋谷区" }
  street_address  { "道玄坂２丁目" }
  telephone       { "09012345678" }
  end
end