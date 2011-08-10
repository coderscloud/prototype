class AddObjectiveToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :objective, :text
  end

  def self.down
    remove_column :projects, :objective
  end
end
