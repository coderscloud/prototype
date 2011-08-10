class CreateDevelopments < ActiveRecord::Migration
  def self.up
    create_table :developments do |t|
      t.integer :project_id
      t.integer :prog_lang_id

      t.timestamps
    end
  end

  def self.down
    drop_table :developments
  end
end
