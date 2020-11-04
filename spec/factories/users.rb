FactoryBot.define do
  factory :user do
    first_name { "member" }
    last_name  { "user" }
    email { "memberuser1@test.com" }
    password { "asdasd"   }
  end
end