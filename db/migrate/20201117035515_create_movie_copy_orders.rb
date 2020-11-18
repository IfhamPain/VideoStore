class CreateMovieCopyOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_copy_orders do |t|
      t.belongs_to :movie_copy
      t.belongs_to :order

      t.timestamps
    end
  end
end
