class Address < ApplicationRecord
  belongs_to :item
  # with_options presece: true do
  #   validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
  #   validates :prefecture_id, numericality: {other_than: 1, message: "Select"}
  #   validates :city
  #   validates :house_number
  #   validates :phone_number, numericality: { with: /\A\d{10}$|^\d{11}\z/, message: "Input correctly"}
  # end
end
