class CreateActions < ActiveRecord::Migration
  def self.up
    create_table :actions do |t|
      t.integer :user_id, :null => false
      t.integer :action_type, :null => false
      t.integer :target_id 
      t.string  :target_type 
      t.integer  :status
      t.integer  :priority
      t.timestamps
    end
  end

  def self.down
    drop_table :actions
  end
end
