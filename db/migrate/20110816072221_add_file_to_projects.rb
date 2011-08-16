class AddFileToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :specfile, :string
  end

  def self.down
    remove_column :projects, :specfile
  end
end
