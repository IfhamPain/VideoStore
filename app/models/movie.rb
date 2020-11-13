class Movie < ApplicationRecord
  has_many :movie_genres
  has_many :genres, through: :movie_genres
  has_many :actor_movies
  has_many :actors, through: :actor_movies
  has_one_attached :thumbnail
  accepts_nested_attributes_for :actors, allow_destroy: true, reject_if: :all_blank

  enum content: [:g, :pg, :pg13, :r, :nc17]

  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 200}
  validates :genres, presence: true
  validates :content, presence: true
  validates :actors, presence: true

  include PgSearch::Model
  pg_search_scope :search, against: [:title, :description],
                  using: {tsearch: {dictionary: "english"}}

  def self.text_search(query)
    if query.present?
      search(query)
    end
  end

end
