# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170626204001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amizades", force: :cascade do |t|
    t.integer "seguidor_id"
    t.integer "seguido_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seguido_id"], name: "index_amizades_on_seguido_id"
    t.index ["seguidor_id", "seguido_id"], name: "index_amizades_on_seguidor_id_and_seguido_id", unique: true
    t.index ["seguidor_id"], name: "index_amizades_on_seguidor_id"
  end

  create_table "ingredientes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredientes_receitas", force: :cascade do |t|
    t.bigint "receita_id", null: false
    t.bigint "ingrediente_id", null: false
    t.float "quantidade"
    t.index ["ingrediente_id"], name: "index_ingredientes_receitas_on_ingrediente_id"
    t.index ["receita_id"], name: "index_ingredientes_receitas_on_receita_id"
  end

  create_table "receitas", force: :cascade do |t|
    t.string "title"
    t.text "modo_de_preparo"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["usuario_id"], name: "index_receitas_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "name"
    t.string "login"
    t.string "email"
    t.string "password"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text "sobre"
  end

  add_foreign_key "receitas", "usuarios"
end
