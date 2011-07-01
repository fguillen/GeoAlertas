class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table 'alerts', :force => false do |t|
      t.column :address,    :string,   :null => false, :limit => 255
      t.column :latitude,   :string,   :null => false, :limit => 20
      t.column :longitude,  :string,   :null => false, :limit => 20
      t.column :radius,     :integer,  :null => false
      t.column :text,       :text,     :null => false
      t.column :status,     :sting,    :null => false, :limit => 20
      t.column :created_at, :datetime, :null => false
      t.column :updated_at, :datetime, :null => false
      t.column :user_id,    :integer,  :null => false
    end
  end

  def self.down
    drop_table :alerts
  end
end
