FactoryBot.define do
  factory :movie_copy_order do
    movie_copy_id  { create(:movie_copy).id }
    order_id { create(:order).id }
  end
end