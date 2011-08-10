class CreatePrNbUsers < ActiveRecord::Migration
  def self.up
    create_table :pr_nb_users do |t|
      t.string :number

      t.timestamps
    end
  end

  def self.down
    drop_table :pr_nb_users
  end
end
