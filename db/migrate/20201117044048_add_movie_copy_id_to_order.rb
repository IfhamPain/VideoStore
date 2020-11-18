class AddMovieCopyIdToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :movie_copy, foreign_key: true
  end
end
