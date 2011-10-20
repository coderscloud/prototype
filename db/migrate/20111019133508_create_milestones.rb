class CreateMilestones < ActiveRecord::Migration
  def self.up
    create_table :milestones do |t|
      t.integer :project_id
      t.string :date
      t.string :name
      t.string :status
      t.integer :task_id

      t.timestamps
    end
  end

  def self.down
    drop_table :milestones
  end
end
