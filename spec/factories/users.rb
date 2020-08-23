FactoryBot.define do
  factory :user do
    nickname                        {'suzuki'}
    email                           {Faker::Internet.free_email}
    password                        {'00000a'}
    password_confirmation           {password}
    last_name                       {'鈴木'}
    first_name                      {'太郎'} 
    last_name_kana                  {'スズキ'}
    first_name_kana                 {'タロウ'}
    birth_day                       { Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
