FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials}
    email                   {Faker::Internet.free_email}
    password                {"aaa000"}
    password_confirmation   {password}
    last_name               {"漢字かな"}
    first_name              {"漢字かな"}
    last_name_kana          {"カタカナ"}
    first_name_kana         {"カタカナ"}
    birth_date              {Faker::Date.in_date_period}
  end
end