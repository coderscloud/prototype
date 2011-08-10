class AddImagePathToPrProjectType < ActiveRecord::Migration
  def self.up
    add_column :pr_project_types, :image_path, :string
  end

  def self.down
    remove_column :pr_project_types, :image_path
  end
end
