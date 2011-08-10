class AddPrArchitectureToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :pr_arch_id, :integer
    add_column :projects, :func_skills, :string
    add_column :projects, :start_date, :datetime
    add_column :projects, :deliv_date, :datetime
    add_column :projects, :estimated_load, :integer
  end

  def self.down
    remove_column :projects, :pr_arch_id
    remove_column :projects, :func_skills
    remove_column :projects, :start_date
    remove_column :projects, :deliv_date
    remove_column :projects, :estimated_load
  end
end
