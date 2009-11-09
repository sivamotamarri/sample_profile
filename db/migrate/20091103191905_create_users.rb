class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :full_name , :string
      t.column :address , :string
      t.column :city , :string
      t.column :province , :string
      t.column :country , :string
      t.column :postal_code , :string
      t.column :picture,:string
      t.column :account_id,:integer
      t.column :myname , :string
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end 