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

ActiveRecord::Schema.define(version: 2021_11_23_164426) do

  create_table "announcements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "price"
    t.integer "amount"
    t.bigint "device_color_id"
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_color_id"], name: "index_announcements_on_device_color_id"
    t.index ["plan_id"], name: "index_announcements_on_plan_id"
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "colors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "csv_announcements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "csv_id"
    t.bigint "announcement_id"
    t.index ["announcement_id"], name: "index_csv_announcements_on_announcement_id"
    t.index ["csv_id"], name: "index_csv_announcements_on_csv_id"
  end

  create_table "csvs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_colors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "device_id"
    t.bigint "color_id"
    t.index ["color_id"], name: "index_device_colors_on_color_id"
    t.index ["device_id"], name: "index_device_colors_on_device_id"
  end

  create_table "devices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_devices_on_brand_id"
  end

  create_table "plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "announcements", "device_colors"
  add_foreign_key "announcements", "plans"
  add_foreign_key "csv_announcements", "announcements"
  add_foreign_key "csv_announcements", "csvs"
  add_foreign_key "device_colors", "colors"
  add_foreign_key "device_colors", "devices"
  add_foreign_key "devices", "brands"
end
