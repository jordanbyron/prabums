class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.integer :work_order_id
      t.integer :created_by_id
      t.integer :updated_by_id
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
