class CreateCarts < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
      t.decimal :total, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :carts
  end
end
