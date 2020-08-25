FactoryBot.define do
  factory :item do
    association                :user
    name                       {Faker::Lorem.sentence}
    description                {Faker::Lorem.sentence}
    category_id                {'2'}
    condition_id               {'2'}
    postage_payer_id           {'2'}
    shipping_day_id            {'2'}
    prefecture_id              {'2'}
    price                      {'300'}
  end
end
