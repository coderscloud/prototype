class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :employer_id
      t.integer :title
      t.integer :project_type_id
      t.integer :nb_users_id
      t.integer :process_time_id      
      t.integer :usage_freq_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
