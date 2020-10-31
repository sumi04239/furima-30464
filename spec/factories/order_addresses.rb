FactoryBot.define do
  factory :order_address do
    post_code {"000-0000"}
    prefecture_id { 0 }
    city {"札幌市"}
    lot_number {"あああ"}
    building_name {"名前"}
    phone_number { "00000000000"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end