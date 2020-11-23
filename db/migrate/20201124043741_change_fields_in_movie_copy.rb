class ChangeFieldsInMovieCopy < ActiveRecord::Migration[6.0]
  def change
    add_index :movie_copies, [:movie_id, :movie_copy_type_id], unique: true
  end
end
