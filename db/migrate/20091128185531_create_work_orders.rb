class CreateWorkOrders < ActiveRecord::Migration
  def self.up
    create_table :work_orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.integer :building_id
      t.string :room_number
      t.string :email
      t.string :location_of_problem
      t.text :problem
      t.integer :status_id

      t.timestamps
    end
  end

  def self.down
    drop_table :work_orders
  end
end
