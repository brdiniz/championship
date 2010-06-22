class AddHomeAndVisitantToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :home_id, :integer
    add_column :games, :home_type, :string
    add_column :games, :visitant_id, :integer
    add_column :games, :visitant_type, :string
  end

  def self.down
    remove_column :games, :visitant_type
    remove_column :games, :visitant_id
    remove_column :games, :home_type
    remove_column :games, :home_id
  end
end
