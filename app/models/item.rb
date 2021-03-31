class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :state
  belongs_to :shipping_cost
  belongs_to :days_to_delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than: 300, less_than: 10000000}
    with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :state_id
    validates :shipping_cost_id
    validates :days_to_delivery_id
    end
  end
end
