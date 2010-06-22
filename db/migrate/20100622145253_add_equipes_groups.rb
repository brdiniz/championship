class AddEquipesGroups < ActiveRecord::Migration
  def self.up
    drop_table :equipes_championships
    create_table :equipes_groups, :id => false do |t|
      t.integer :equipe_id
      t.integer :group_id
    end
  end

  def self.down
    create_table :equipes_championships, :id => false do |t|
      t.integer :equipe_id
      t.integer :championship_id
    end
  end
end
