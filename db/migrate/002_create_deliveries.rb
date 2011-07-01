class CreateDeliveries < ActiveRecord::Migration
  def self.up
    create_table 'deliveries', :force => false do |t|
      t.column :alert_id,  :integer,   :null => false
      t.column :date,      :datetime,  :null => false
    end
  end

  def self.down
    drop_table :deliveries
  end
end
