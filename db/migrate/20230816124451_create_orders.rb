class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.string :name
      t.string :postal_code

      t.timestamps
    end
  end
end
