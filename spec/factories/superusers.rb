FactoryBot.define do
  factory :superuser do
    first_name { "super" }
    last_name  { "user" }
    email { "superuser@test.com" }
    password { "asdasd"   }
  end
end