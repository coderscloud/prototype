class AddChosenOfferToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :chosen_offer_id, :integer
  end

  def self.down
  end
end
