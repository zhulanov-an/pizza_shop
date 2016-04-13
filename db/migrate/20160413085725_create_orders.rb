class CreateOrders < ActiveRecord::Migration
  def change
    create_table :Orders do |t|
      t.text :phone
      t.text :name_customer
      t.text :composition_orders
      t.text :datetime_delivery
      t.decimal :total_price

      t.timestamps
    end
  end
end
