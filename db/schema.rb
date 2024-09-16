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

ActiveRecord::Schema.define(version: 2024_09_03_004049) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "localizacaos", force: :cascade do |t|
    t.string "linha", limit: 20
    t.string "armazem", limit: 3
    t.string "rua", limit: 3
    t.string "predio", limit: 3
    t.string "andar", limit: 3
    t.string "slot", limit: 3
    t.string "endereco", limit: 20
    t.string "classificacao", limit: 20
    t.string "acesso", limit: 20
    t.string "volume", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordem_producao", force: :cascade do |t|
    t.integer "opr_codigo"
    t.integer "opr_subcodigo"
    t.integer "prp_codigo"
    t.string "opr_situacao"
    t.string "opr_descricao"
    t.string "opr_numeroserie"
    t.string "opr_tipofrete"
    t.string "opr_estado"
    t.string "opr_cidade"
    t.date "opr_liberadoem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "producao_items", force: :cascade do |t|
    t.integer "opr_codigo", null: false
    t.integer "opr_subcodigo", null: false
    t.integer "opi_item", null: false
    t.string "pro_codigo", null: false
    t.string "opi_referencia", null: false
    t.string "opi_descricao"
    t.integer "opi_quantidade"
    t.integer "opi_qtdeseparado"
    t.integer "producao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producao_id"], name: "index_producao_items_on_producao_id"
  end

  create_table "producaoitems", force: :cascade do |t|
    t.integer "opr_codigo"
    t.integer "opr_subcodigo"
    t.integer "opi_item"
    t.string "pro_codigo"
    t.string "opi_referencia"
    t.string "opi_descricao"
    t.integer "opi_quantidade"
    t.integer "opi_qtdeseparado"
    t.integer "producao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producao_id"], name: "index_producaoitems_on_producao_id"
  end

  create_table "producaos", force: :cascade do |t|
    t.integer "opr_codigo"
    t.integer "opr_subcodigo"
    t.integer "prp_codigo"
    t.string "opr_situacao"
    t.string "opr_descricao"
    t.string "opr_numeroserie"
    t.string "opr_tipofrete"
    t.string "opr_estado"
    t.string "opr_cidade"
    t.date "opr_liberadoem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
