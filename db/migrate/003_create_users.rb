class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table 'users', :force => false do |t|
      t.column :phone,               :string,   :null => false, :limit => 9
      t.column :password_localizame, :string,   :null => false, :limit => 40
      t.column :password_sms,        :string,   :null => false, :limit => 40
      t.column :email,               :string,   :null => false, :limit => 128
      t.column :password,            :string,   :null => false, :limit => 40
      t.column :created_at,          :datetime, :null => false
      t.column :updated_at,          :datetime, :null => false
      t.column :role,                :string,   :null => false, :limit => 20
    end
  end

  def self.down
    drop_table :users
  end
end
