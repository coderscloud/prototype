class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.integer :user_id, :null => false
      t.integer :notification_type, :null => false
      t.integer :target_id, :null => false
      t.string  :target_type, :null => false
      
      t.timestamps
    end
    add_index :notifications, [:target_id, :target_type]
    add_index :notifications, :user_id
  end

  def self.down
    drop_table :notifications
  end
end
