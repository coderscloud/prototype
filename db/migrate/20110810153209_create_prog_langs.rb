class CreateProgLangs < ActiveRecord::Migration
  def self.up
    create_table :prog_langs do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :prog_langs
  end
end
