class AddReadToNotifications < ActiveRecord::Migration
  def self.up
        add_column :notifications, :is_read, :boolean, :default => false
  end

  def self.down
  end
end
