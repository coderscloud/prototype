class CreatePrProcessTimes < ActiveRecord::Migration
  def self.up
    create_table :pr_process_times do |t|
      t.string :time

      t.timestamps
    end
  end

  def self.down
    drop_table :pr_process_times
  end
end
