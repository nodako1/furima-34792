class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :state, :shipping_cost, :days_to_delivery

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :state_id, numericality: { other_than: 1 }
    validates :shipping_cost_id, numericality: { other_than: 1 }
    validates :days_to_delivery_id, numericality: { other_than: 1 }
  end
end
