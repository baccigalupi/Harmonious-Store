class CreateCartLineItems < ActiveRecord::Migration
  def self.up
    create_table :cart_line_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :cart_line_items
  end
end
