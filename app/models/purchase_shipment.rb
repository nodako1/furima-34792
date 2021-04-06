class PurchaseShipment
include ActiveModel::Model
attr_accessor :post_code, :state_id, :city, :street_address, :suburb, :telephone, :user_id, :item_id, :token

with_options presence: true do
  validates :user_id
  validates :item_id
  validates :post_code     , format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :city
  validates :street_address
  validates :telephone     , format: {with: /\A\d{10,11}\z/, message: "is invalid."}
  validates :token
end
  validates :state_id, numericality: {other_than: 0, message: "can't be blank"}

def save
  purchase = Purchase.create!(item_id: item_id, user_id: user_id)
  Shipment.create!(post_code: post_code, state_id: state_id, city: city, street_address: street_address, suburb: suburb, telephone: telephone, purchase_id: purchase.id)
end

end