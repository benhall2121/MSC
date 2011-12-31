class AddColumnsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :wedding, :boolean
    add_column :projects, :special, :boolean
    add_column :projects, :parties, :boolean
  end

  def self.down
    remove_column :projects, :parties
    remove_column :projects, :special
    remove_column :projects, :wedding
  end
end
