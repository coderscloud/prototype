class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.integer :project_id
      t.integer :submitter_id
      t.datetime :start_date
      t.datetime :end_date
      t.integer :nb_days
      t.text :message
      
      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
