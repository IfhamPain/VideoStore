FactoryBot.define do
  factory :order do
    user_id { create(:user).id }
    order_date {Date.parse("2020-11-10")}
    expiration_date {Date.parse("2020-11-17")}
    return_date {Date.parse("2020-11-15")}
    status {false}
  end
end
