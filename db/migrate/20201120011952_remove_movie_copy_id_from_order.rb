class RemoveMovieCopyIdFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :movie_copy_id
  end
end
