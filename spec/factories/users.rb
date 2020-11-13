FactoryBot.define do
  factory :user do
    first_name { "member" }
    last_name  { "user" }
    email { "memberuser12@test.com" }
    password { "asdasd"   }
    address { "sample address"}
    gender { User.genders[:male]}
    role { User.roles[:member] }
  end
end