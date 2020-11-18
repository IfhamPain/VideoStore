class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :superuser, foreign_key: true
      t.datetime :order_date
      t.datetime :return_date
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
