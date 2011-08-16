class CreateSpecfiles < ActiveRecord::Migration
  def self.up
    create_table :specfiles do |t|
      t.integer :project_id
      t.string :file

      t.timestamps
    end
  end

  def self.down
    drop_table :specfiles
  end
end
