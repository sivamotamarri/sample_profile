class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.column :user_name , :string
      t.column :password_salt, :string
      t.column :password_hash, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
