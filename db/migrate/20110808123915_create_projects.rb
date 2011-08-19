class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :employer_id
      t.string :title
      t.integer :pr_project_type_id
      t.integer :pr_nb_user_id
      t.integer :pr_process_time_id      
      t.integer :pr_usage_freq_id
      
      t.timestamps
    end
    
  end

  def self.down
    drop_table :projects
  end
end
