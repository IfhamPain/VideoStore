class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  validates :name, presence: true, length: {maximum: 50}
  validates :date_of_birth, presence: true
  validate :date_of_birth_validation

  def date_of_birth_validation
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "Date of birth cannot be a future date")
    end
  end

  include Filterable #filtering
  #Scopes for Actor filter
  scope :filter_by_name, ->(actor_name_search) {where("lower(name) LIKE ?", "%#{actor_name_search.downcase}%")}
end
