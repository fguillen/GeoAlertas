class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations, :force => false do |t|
      t.column :user_id,    :integer,  :null => false
      t.column :latitude,   :string,   :null => false, :limit => 20
      t.column :longitude,  :string,   :null => false, :limit => 20
      t.column :address,    :string,   :null => true,  :limit => 255
      t.column :date,       :datetime, :null => false
      t.column :error,      :boolean,  :default => false
    end
  end

  def self.down
    drop_table :locations
  end
end