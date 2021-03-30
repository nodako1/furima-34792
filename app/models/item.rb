class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :state, :shipping_cost, :days_to_delivery

  with_options presence: true do
    validates :name
    validates :description
    validates :price, format: { with: /^[0-9]+$/ }
    with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :state_id
    validates :shipping_cost_id
    validates :days_to_delivery_id
    end
  end
end
