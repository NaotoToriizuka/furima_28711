class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: {other_than: 1, message: "Select"} 
    validates :condition_id, numericality: {other_than: 1, message: "Select"}
    validates :postage_payer_id, numericality: {other_than: 1, message: "Select"}
    validates :shipping_day_id, numericality: {other_than: 1, message: "Select"}
    validates :prefecture_id, numericality: {other_than: 1, message: "Select"}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}, format: { with: /\A[0-9]+\z/, message: "Half-width number"}
  end
end
