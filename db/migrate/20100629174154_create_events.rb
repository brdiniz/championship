class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.belongs_to :game
      t.belongs_to :equipe
      t.string :kind
      t.string :linetime

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
