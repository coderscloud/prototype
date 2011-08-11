class CreatePrArches < ActiveRecord::Migration
  def self.up
    create_table :pr_arches do |t|
      t.string :arch

      t.timestamps
    end
  end

  def self.down
    drop_table :pr_arches
  end
end
