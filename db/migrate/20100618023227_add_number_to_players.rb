class AddNumberToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :number, :int
  end

  def self.down
    remove_column :players, :number
  end
end
