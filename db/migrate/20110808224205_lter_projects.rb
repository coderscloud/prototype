class LterProjects < ActiveRecord::Migration
  def self.up
   change_column :projects, :title, :string
  end

  def self.down
  end
end
