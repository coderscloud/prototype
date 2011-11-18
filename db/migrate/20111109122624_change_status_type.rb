class ChangeStatusType < ActiveRecord::Migration
  def up
      remove_column :projects, :status
      add_column :projects, :status, :integer
  end

  def down
  end
end
