class CreateInterfacings < ActiveRecord::Migration
  def self.up
    create_table :interfacings do |t|
      t.integer :project_id
      t.integer :application_id

      t.timestamps
    end
  end

  def self.down
    drop_table :interfacings
  end
end
