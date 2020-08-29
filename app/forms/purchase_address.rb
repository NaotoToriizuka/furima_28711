class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

 with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: {other_than: 1, message: "Select"}
    validates :city 
    validates :house_number
    validates :phone_number, numericality: { with: /\A\d{10}$|^\d{11}\z/, message: "Input correctly"}
  end

  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    # purchase_id = Purchase.create
    # binding.pry
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_id: item_id)
  end
end