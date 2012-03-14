class AddOrderInfoToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :delivery_date, :datetime
    add_column :messages, :flavor, :string
    add_column :messages, :design, :string
    add_column :messages, :delievery_type, :string
    add_column :messages, :special_instruction, :text
  end

  def self.down
    remove_column :messages, :special_instruction
    remove_column :messages, :delievery_type
    remove_column :messages, :design
    remove_column :messages, :flavor
    remove_column :messages, :delivery_date
  end
end
