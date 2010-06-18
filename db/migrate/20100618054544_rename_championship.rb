class RenameChampionship < ActiveRecord::Migration
  def self.up
    rename_column :equipes_championships, :championships_id, :championship_id
  end

  def self.down
    rename_column :equipes_championships, :championship_id, :championships_id
  end
end
