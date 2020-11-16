class CreateMovieCopyType < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_copy_types do |t|
      t.string :copy_type

      t.timestamps
    end
  end
end
