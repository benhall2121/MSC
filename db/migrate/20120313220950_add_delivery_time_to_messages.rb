class AddDeliveryTimeToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :delivery_time, :string
  end

  def self.down
    remove_column :messages, :delivery_time
  end
end
