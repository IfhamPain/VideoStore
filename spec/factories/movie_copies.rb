FactoryBot.define do
  factory :movie_copy do
    movie_id  { create(:movie).id }
    movie_copy_type_id { create(:movie_type).id }
    barcode  { "123333" }
    copy_price {120.00}
    stock {15}
  end
end