class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string, :limit => 40
      t.column :name,                      :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :reset_password,            :boolean
      t.column :ra,                        :boolean
      t.column :rd,                        :boolean
      t.column :administrator,             :boolean
      t.column :service_provider,          :boolean
      t.column :company,                   :string
      t.column :building_id,               :integer
      t.column :coverage_area,             :string
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime

    end
    add_index :users, :login, :unique => true
  end

  def self.down
    drop_table "users"
  end
end
