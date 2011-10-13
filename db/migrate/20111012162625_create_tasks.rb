class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :project_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :nb_days
      t.string :name
      t.string :status
      t.integer :progress
  
      
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
