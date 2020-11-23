FactoryBot.define do
  factory :user do
    first_name { "member" }
    last_name  { "user" }
    sequence(:email) { |n| "member#{n}@test.com" }
    password { "asdasd"   }
    address { "sample address"}
    gender { 0 }
  end
end