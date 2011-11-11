class ChangeStatusType < ActiveRecord::Migration
  def self.up
      change_table :projects do |t|
        t.change :status, :integer
      end
  end

  def self.down
  end
end
