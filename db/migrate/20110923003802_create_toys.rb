class CreateToys < ActiveRecord::Migration
  def self.up
    create_table :toys do |t|
      t.string :toy_name
      t.string :desc
      t.string :moments

      t.timestamps
    end
  end

  def self.down
    drop_table :toys
  end
end
