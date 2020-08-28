class Address < ApplicationRecord
  belongs_to :purchase


  with_options presece: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
  end
end
