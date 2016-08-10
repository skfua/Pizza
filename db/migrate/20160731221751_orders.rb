class Orders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :name
      t.text :phone
      t.text :adress
      t.text :order_list
    end
  end
end
