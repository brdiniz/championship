# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100622163128) do

  create_table "championships", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipes_groups", :id => false, :force => true do |t|
    t.integer "equipe_id"
    t.integer "group_id"
  end

  create_table "games", :force => true do |t|
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "home_id"
    t.string   "home_type"
    t.integer  "visitant_id"
    t.string   "visitant_type"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "championship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "equipe_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
  end

  create_table "rounds", :force => true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
