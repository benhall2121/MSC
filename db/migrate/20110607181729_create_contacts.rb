class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :title
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :phone
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
