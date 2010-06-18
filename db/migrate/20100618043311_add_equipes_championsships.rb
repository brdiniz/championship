class AddEquipesChampionsships < ActiveRecord::Migration
  def self.up
    create_table :equipes_championships, :id => false do |t|
      t.integer :equipe_id
      t.integer :championships_id
    end
  end

  def self.down
    drop_table :equipes_championships
  end
end
