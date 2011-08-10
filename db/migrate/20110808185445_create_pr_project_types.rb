class CreatePrProjectTypes < ActiveRecord::Migration
  def self.up
    create_table :pr_project_types do |t|
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :pr_project_types
  end
end
