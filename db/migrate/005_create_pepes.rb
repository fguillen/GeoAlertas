class CreatePepes < ActiveRecord::Migration
  def self.up
    create_table :pepes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :pepes
  end
end
