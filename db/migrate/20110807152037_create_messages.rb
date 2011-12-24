class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text :message
      t.string :name
      t.string :email
      t.string :number

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
