class CreateMovieGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_genres do |t|
      t.belongs_to :movie
      t.belongs_to :genre
      t.timestamps
    end
  end
end
