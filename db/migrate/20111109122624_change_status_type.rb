class ChangeStatusType < ActiveRecord::Migration
  def self.up
      remove_column :projects, :status
      add_column :projects, :status, :integer
  end

  def self.down
  end
end
