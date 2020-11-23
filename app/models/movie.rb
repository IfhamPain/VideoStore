class Movie < ApplicationRecord
  has_many :movie_genres
  has_many :genres, through: :movie_genres
  has_many :actor_movies
  has_many :actors, through: :actor_movies
  has_one_attached :thumbnail
  has_many :movie_copies, dependent: :destroy
  has_many :movie_copy_types, through: :movie_copies
  accepts_nested_attributes_for :actors, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :movie_copies, allow_destroy: true
  accepts_nested_attributes_for :movie_copy_types

  enum content: [:g, :pg, :pg13, :r, :nc17]

  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 200}
  validates :content, presence: true

  include PgSearch::Model
  pg_search_scope :search, against: [:title, :description],
                  using: {tsearch: {dictionary: "english"}}

  def self.text_search(query)
    if query.present?
      search(query)
    end
  end

  #Instance method to calculate on hand stock
  def on_hand_stock(outstanding_orders)
    self.movie_copies.pluck(:stock).sum - outstanding_orders
  end

end
