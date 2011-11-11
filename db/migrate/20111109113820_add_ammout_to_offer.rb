class AddAmmoutToOffer < ActiveRecord::Migration
  def self.up
     add_column :offers, :amount, :integer
  end

  def self.down
  end
end
