class CreatePrUsageFreqs < ActiveRecord::Migration
  def self.up
    create_table :pr_usage_freqs do |t|
      t.string :freq

      t.timestamps
    end
  end

  def self.down
    drop_table :pr_usage_freqs
  end
end
