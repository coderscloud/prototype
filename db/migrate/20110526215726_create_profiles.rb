class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :country
      t.string :overview
      t.string :skills

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
