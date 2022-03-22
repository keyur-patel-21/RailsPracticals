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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2022_03_16_111803) do
=======

ActiveRecord::Schema.define(version: 2022_03_15_085322) do
>>>>>>> 45b4a50fb13ce9a84ec733f844e07f1b5d1fb283

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "email"
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id"
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "f_firstname"
    t.string "f_lastname"
    t.integer "f_phone"
    t.string "f_email"
    t.date "f_dob"
    t.string "f_designation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer "imageable_id"
    t.string "imageable_type"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "s_firstname"
    t.string "s_lastname"
    t.date "s_dob"
    t.string "s_department"
    t.string "s_terms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
