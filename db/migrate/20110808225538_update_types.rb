class UpdateTypes < ActiveRecord::Migration
  def self.up
    rename_column :pr_project_types, :type, :ptype  
  end

  def self.down
  end
end
