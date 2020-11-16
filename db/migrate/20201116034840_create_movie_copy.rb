class CreateMovieCopy < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_copies do |t|
      t.belongs_to :movie
      t.belongs_to :movie_copy_type
      t.integer :barcode
      t.float :copy_price
      t.integer :stock

      t.timestamps
    end
  end
end
