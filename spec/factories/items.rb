FactoryBot.define do
  factory :item do
    goods_name { 'aiueo' }
    description { 'aiueo' }
    category_id { 0 }
    condition_id { 0 }
    post_payer_id { 0 }
    prefecture_id { 0 }
    heading_time_id { 0 }
    price { 350 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
